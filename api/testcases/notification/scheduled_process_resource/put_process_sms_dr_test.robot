*** Settings ***
Documentation    Tests to verify that processSmsDR api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/scheduled_process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    batch_processor
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_06341
    [Documentation]    [Notification][processSmsDR] Request API to move all DR files to "processing" folder
    [Tags]    Regression    Medium    E2E    Smoke    UnitTest
    Put Process Sms DR
    Response Correct Code    ${SUCCESS_CODE}

TC_O2O_06344
    [Documentation]     [Notification][processSmsDR] Request API without "batch_processor" scope returns 403
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Put Process Sms DR
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    batch_processor
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope