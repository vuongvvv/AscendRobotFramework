*** Settings ***
Documentation    Tests to verify that processUpdateMessageStatus api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/scheduled_process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    batch_processor
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_06345
    [Documentation]    [Notification][processUpdateMessageStatus] Request API will update message and audiences status
    [Tags]    Regression    Medium    E2E    Smoke    UnitTest
    Put Process Update Message Status
    Response Correct Code    ${SUCCESS_CODE}

TC_O2O_06348
    [Documentation]     [notification][processUpdateMessageStatus] Request API without "batch_processor" scope returns 403
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Put Process Update Message Status
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    batch_processor
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope