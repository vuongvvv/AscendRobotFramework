*** Settings ***
Documentation    Tests to verify that updateMerchantTemplate api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.update
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
@{status_list}    ACTIVE    INACTIVE

*** Test Cases ***
TC_O2O_06925
    [Documentation]    [NotificationProducer][updateMerchantTemplate] Request with "notification.template.update" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Put Update Merchant Template    { "id": 1, "action": "TY_REJECT", "senderName": "TrueYou", "type": "SMS", "template": "ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant" }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    id    ${1}
    Response Should Contain Property With Value    action    TY_REJECT
    Response Should Contain Property With Value    senderName    TrueYou
    Response Should Contain Property With Value    type    SMS
    Response Should Contain Property With Value    template    ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant
    Response Should Contain Property Value Include In List    status    ${status_list}

TC_O2O_06926
    [Documentation]    [NotificationProducer][updateMerchantTemplate] Request without "notification.template.update" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Put Update Merchant Template    { "id": 1, "action": "TY_REJECT", "senderName": "TrueYou", "type": "SMS", "template": "ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant" }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/merchant/templates
    Response Should Contain Property With Value    message    error.http.403