*** Settings ***
Documentation    Tests to verify that createUserAppBlacklist api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_app_blacklist_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user-app-blacklist.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_found_user_id}    999999999

*** Test Cases ***
TC_O2O_02366
    [Documentation]    [uaa][createUserAppBlacklist] Revoke the user access token with the invalid UserID
    [Tags]      Regression     Revoke     Medium        UAA    Sanity    E2E    Smoke
    Post Create User App Blacklist    { "clientId": null, "userId": ${not_found_user_id} }
    Response Correct Code    ${NOT_FOUND_CODE}
	Response Should Contain Property With Value     entityName    userId
	Response Should Contain Property With Value     errorKey    USER_NOT_FOUND
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message
	Response Should Contain Property With Value     title    user id not found
	Response Should Contain Property With Value     status    ${${NOT_FOUND_CODE}}
	Response Should Contain Property With Value     message    error.USER_NOT_FOUND
	Response Should Contain Property With Value     params    userId