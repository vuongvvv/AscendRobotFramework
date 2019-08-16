*** Settings ***
Documentation    Tests to verify that getAuthorities api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user.list
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_08053
    [Documentation]     [uaa][getAuthorities] Request with "uaa.user.list" permission returns 200
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Get Authorities
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be String