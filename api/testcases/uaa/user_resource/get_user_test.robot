*** Settings ***
Documentation    Tests to verify that getUser api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_08052
    [Documentation]     [uaa][getUser] Request with ROLE_USER returns 200
    [Tags]    Regression     High    Sanity    Smoke    E2E
    Get User    ${ROLE_USER}
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain Property With Boolean Value     activated
	Response Should Contain Property Value Is String Or Empty List     authorities
	Response Should Contain Property With String Value     createdBy
	Response Should Contain Property Matches Regex     createdDate    ${date_regex}
	Response Should Contain Property With String Or Null     email
	Response Should Contain Property With String Or Null     firstName
	Response Should Contain Property With Number String     id
	Response Should Contain Property With String Or Null     .imageUrl
	Response Should Contain Property With String Or Null     .langKey
	Response Should Contain Property With String Value     .lastModifiedBy
	Response Should Contain Property Matches Regex Or Null     .lastModifiedDate    ${date_regex}
	Response Should Contain Property With String Or Null     .lastName
	Response Should Contain Property With String Value     .login
	Response Should Contain Property With Number String Or Null     .mobile