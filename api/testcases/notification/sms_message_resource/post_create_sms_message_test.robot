*** Settings ***
Documentation    Tests to verify that createSMSMessage api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/sms_message_resource_keywords.robot
Test Setup    Run Keywords    Generate External Transaction Reference    AND    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    sms.create
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${sender_name_more_than_12_characters}    SenderName12
${sender_name}    SenderName
${messageBody}    ร้านของท่านไม่ผ่านการพิจารณาอนุมัติเป็นพันธมิตรร้านค้ากับทรู เนื่องจากรายการไม่สมบูรณ์ กรุณาลงทะเบียนอีกครั้งเพื่อยืนยันการสมัคร คลิก http://onelink.to/smartmerchant
*** Test Cases ***
TC_O2O_06308
    [Documentation]    [API][Notification][createSMSMessage] Request with valid data returns 200, message is saved into Kafka topic
    [Tags]    Regression    Smoke    High    E2E
    Post Create SMS Message    { "senderName": "${sender_name}", "messageBody": "${messageBody}", "externalTransactionReference": "${EXTERNAL_TRANSACTION_REFERENCE}", "audiences": ["66610095616"] }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be Empty Body

TC_O2O_06325
    [Documentation]    [API][Notification][createSMSMessage] Request without scope "sms.create" returns 403
    [Tags]    Regression    High
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Generate External Transaction Reference
    Post Create SMS Message    { "senderName": "${sender_name}", "messageBody": "${messageBody}", "externalTransactionReference": "${EXTERNAL_TRANSACTION_REFERENCE}", "audiences": ["66610095616"] }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    error    insufficient_scope
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    scope    sms.create

TC_O2O_06318
    [Documentation]    [Notification][createSMSMessage] Request with more than 11 characters "senderName" returns 400
    [Tags]    Regression    Smoke    Medium    E2E    Sanity
    Post Create SMS Message    { "senderName": "${sender_name_more_than_12_characters}", "messageBody": "${messageBody}", "externalTransactionReference": "${EXTERNAL_TRANSACTION_REFERENCE}", "audiences": ["66610095616"] }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Sender Name must be must be between 1 to 11 characters.
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    params    senderName
    Response Should Contain Property With Value    message    error.SMS_SENDER_NAME_INVALID_LENGTH
    Response Should Contain Property With Value    errorKey    SMS_SENDER_NAME_INVALID_LENGTH
    Response Should Contain Property With Value    entityName    senderName