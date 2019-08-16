*** Settings ***
Documentation    Tests to verify that createMerchantTemplate api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.create
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_06908
    [Documentation]    [NotificationProducer][createMerchantTemplate] Request with "notification.template.create" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Post Create Merchant Template    { "action": "TY_REJECT", "senderName": "TrueYou", "type": "SMS", "template": "ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant" }
    Response Correct Code    ${CREATED_CODE}
    Response Should Contain Property With Number String    id
    Response Should Contain Property With Value    action    TY_REJECT
    Response Should Contain Property With Value    senderName    TrueYou
    Response Should Contain Property With Value    type    SMS
    Response Should Contain Property With Value    template    ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant
    Response Should Contain Property With Value    status    INACTIVE

TC_O2O_06909
    [Documentation]    [NotificationProducer][createMerchantTemplate] Request without "notification.template.create" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Post Create Merchant Template    { "action": "TY_REJECT", "senderName": "TrueYou", "type": "SMS", "template": "ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant" }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/merchant/templates
    Response Should Contain Property With Value    message    error.http.403