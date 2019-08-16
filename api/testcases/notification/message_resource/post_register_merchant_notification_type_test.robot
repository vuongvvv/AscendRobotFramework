*** Settings ***
Documentation    Tests to verify that createMessage api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/message_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}
${merchant_id}    5b4f06ec30a578000198df80

*** Test Cases ***
TC_O2O_01272
    [Documentation]    [notification][createMessage]To verify that create message API will return error 403 when user does not bind to the Merchant
    [Tags]    Regression    Medium    UnitTest    E2E    Sanity
    Post Create Message    { "condition": [ { "end": "2018-06-01T23:59:59.824Z", "start": "2018-06-01T00:01:00.824Z" } ], "merchantId": "${merchant_id}", "messageBody":"To The World NCT", "title": "ทดสอบ", "typeId": ${type_id} }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    entityName    merchantId
    Response Should Contain Property With Value    errorKey    permissiondenied
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Permission Denied
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    message    error.permissiondenied
    Response Should Contain Property With Value    params    merchantId
