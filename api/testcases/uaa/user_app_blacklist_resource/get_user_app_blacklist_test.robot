*** Settings ***
Documentation    Tests to verify that getUserAppBlacklist api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_app_blacklist_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user-app-blacklist.actAsAdmin    AND    Get Blacklist Id
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${regex_date}               ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d+Z$

*** Test Cases ***
TC_O2O_02685
    [Documentation]    [uaa][getUserAppBlacklist] Displayed blacklist details - Admin Permission
    [Tags]      Regression     Blacklist     Admin     Medium        UAA      Getblacklist    E2E    Smoke    Sanity
    Get User App Blacklist    ${BLACKLIST_ID}
    Response Correct Code                           ${SUCCESS_CODE}
	Response Should Contain Property With Number String     clientId
	Response Should Contain Property With String Value     createdBy
	Response Should Contain Property Matches Regex     createdDate    ${regex_date}
	Response Should Contain Property With Value    id    ${BLACKLIST_ID}
	Response Should Contain Property With String Value     lastModifiedBy
	Response Should Contain Property Matches Regex     lastModifiedDate    ${regex_date}
	Response Should Contain Property Matches Regex     revocationDate    ${regex_date}
	Response Should Contain Property With Number String     userId