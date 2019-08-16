*** Settings ***
Documentation    Tests to verify that getAllUserAppBlacklists api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_app_blacklist_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user-app-blacklist.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${regex_id}                 ^\\d+$
${regex_date}               ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d+Z$

*** Test Cases ***
TC_O2O_02678
    [Documentation]     [uaa][getAllUserAppBlacklists] Displayed all blacklist accounts - Admin Permission
    [Tags]      Regression     Blacklist     Admin     Medium        UAA    Sanity    Smoke    E2E
    Get All User App Blacklists
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Match Regex    .id     ${regex_id}
    Response Should Contain All Property Values Match Regex    .revocationDate    ${regex_date}
    Response Should Contain All Property Values Are Integer    .userId
    Response Should Contain All Property Values Are Number Or Null    .clientId