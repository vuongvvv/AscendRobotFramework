*** Settings ***
Documentation    Tests to verify that GetActiveProfiles api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/profile_info_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_07804
    [Documentation]    [payment][getActiveProfiles] Request with public user returns 200
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Active Profiles
    Response Correct Code    ${SUCCESS_CODE}