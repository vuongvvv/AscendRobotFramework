*** Settings ***
Documentation    Tests to verify that updateMessageStatus api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/message_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_message_id}    999999

*** Test Cases ***
TC_O2O_01134
    [Documentation]    [notification][updateMessageStatus] To verify that API will return error when messageId does not exist
    [Tags]    Regression    High    UnitTest    E2E    Sanity    Smoke
    Put Update Message Status    ${not_exist_message_id}    { "status": "CANCELED" }
    Response Correct Code    ${NOT_FOUND_CODE}
    Response Should Contain Property With Value    errorKey    MESSAGE_ID_NOT_FOUND
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Message not found.
    Response Should Contain Property With Value    status    ${${NOT_FOUND_CODE}}
    Response Should Contain Property With Value    message    error.MESSAGE_ID_NOT_FOUND
    Response Should Contain Property With Empty Value    params