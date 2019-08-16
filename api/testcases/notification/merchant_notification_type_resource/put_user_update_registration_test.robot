*** Settings ***
Documentation    Tests to verify that userUpdateRegistration api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/merchant_notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_type_id}    ${9999}
${exist_merchant_id}    5b4f06ec30a578000198df80

*** Test Cases ***
TC_O2O_01290
    [Documentation]    [notification][UserUpdateRegistration] To verify that API will return error 403 when user who does not have permission to merchant sent the API.
    [Tags]    Regression    High    O2O-1426    E2E    Sanity
    Put User Update Registration    ${not_exist_type_id}    ${exist_merchant_id}    { "senderName": "ErosTest" }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    entityName    merchantId
    Response Should Contain Property With Value    errorKey    permissiondenied
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Permission Denied
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    message    error.permissiondenied
    Response Should Contain Property With Value    params    merchantId