*** Settings ***
Documentation    Tests to verify that ClearOutletCache api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/cache_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_07802
    [Documentation]    [payment][clearOutletCache] Request with public user returns 200
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Delete Clear Outlet Cache
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be Empty Body