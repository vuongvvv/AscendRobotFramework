*** Settings ***
Documentation    Tests to verify that resetAllCache api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/util_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_08540
    [Documentation]     [uaa][resetAllCache] Request with ROLE_USER returns 403
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Delete Reset All Cache
    Response Correct Code    ${FORBIDDEN_CODE}

TC_O2O_08055
    [Documentation]     [uaa][resetAllCache] Request with ROLE_ADMIN returns 200
    [Tags]    Regression     Medium    Smoke    E2E
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_ADMIN}    ${ROLE_ADMIN_PASSWORD}
    Delete Reset All Cache
    Response Correct Code    ${SUCCESS_CODE}