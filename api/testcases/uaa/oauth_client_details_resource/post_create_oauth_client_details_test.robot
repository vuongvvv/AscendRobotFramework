*** Settings ***
Documentation    Tests to verify that createOAuthClientDetails api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/oauth_client_details_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_00386
    [Documentation]     Verify non-admin user can not INSERT any row into “OAuth Client Details” via api  so that when the user call post {url}/uaa/api/oauth-client-details , the response should be 403 Forbidden.
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Post Create OAuth Client Details    { "clientId": "20190607180736020675", "name": "20190607180736020675", "clientSecret": "20190607180736020675", "scope": "DEFAULT", "scopeValues": {}, "authorizedGrantTypes": "password", "accessTokenValidity": 300, "refreshTokenValidity": 604800, "autoApprove": true }
    Response Correct Code    ${FORBIDDEN_CODE}
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message
	Response Should Contain Property With Value     title    Forbidden
	Response Should Contain Property With Value     status    ${${FORBIDDEN_CODE}}
	Response Should Contain Property With Value     detail    Access is denied
	Response Should Contain Property With Value     path    /api/oauth-client-details
	Response Should Contain Property With Value     message    error.http.403