*** Settings ***
Documentation    Tests to verify that isAuthenticated api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_07841
    [Documentation]     [uaa][isAuthenticated] Request with logged in user returns 200
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Get Is Authenticated
    Response Correct Code    ${SUCCESS_CODE}