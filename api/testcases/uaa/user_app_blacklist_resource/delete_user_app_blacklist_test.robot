*** Settings ***
Documentation    Tests to verify that deleteUserAppBlacklist api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/common/log_common.robot
Resource    ../../../keywords/uaa/user_app_blacklist_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user-app-blacklist.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions    AND    Log Bug For Test Case

*** Variables ***
${invalid_client_id}    999999999999

*** Test Cases ***
TC_O2O_02695
    [Documentation]    [uaa][deleteUserAppBlacklist] User delete blacklist account with invalid ID
    [Tags]      Regression     Revoke     Medium        UAA    SanityExclude    E2E    Smoke
    Delete User App Blacklist    ${invalid_client_id}
    Response Correct Code    ${NOT_FOUND_CODE}
	Response Should Contain Property With Value     entityName    clientId
	Response Should Contain Property With Value     errorKey    CLIENT_NOT_FOUND
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message
	Response Should Contain Property With Value     title    client id not found
	Response Should Contain Property With Value     status    ${${NOT_FOUND_CODE}}
	Response Should Contain Property With Value     message    error.CLIENT_NOT_FOUND
	Response Should Contain Property With Value     params    clientId