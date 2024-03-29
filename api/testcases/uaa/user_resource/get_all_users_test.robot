*** Settings ***
Documentation    Tests to verify that getAllUsers api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.user.list
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_08050
    [Documentation]     [uaa][getAllUsers] Request with "uaa.user.list" permission returns 200
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Get All Users
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain All Property Values Are Boolean     .activated
	Response Should Contain All Property Values Are String Or Empty List     .authorities
	Response Should Contain All Property Values Are String     .createdBy
	Response Should Contain All Property Values Match Regex     .createdDate    ${date_regex}
	Response Should Contain All Property Values Are String Or Null     .email
	Response Should Contain All Property Values Are String Or Null     .firstName
	Response Should Contain All Property Values Are Number     .id
	Response Should Contain All Property Values Are String Or Null     .imageUrl
	Response Should Contain All Property Values Are String Or Null     .langKey
	Response Should Contain All Property Values Are String     .lastModifiedBy
	Response Should Contain All Property Values Match Regex Or Null     .lastModifiedDate    ${date_regex}
	Response Should Contain All Property Values Are String Or Null     .lastName
	Response Should Contain All Property Values Are String     .login
	Response Should Contain All Property Values Are Number Or Null     .mobile