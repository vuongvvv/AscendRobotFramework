*** Settings ***
Documentation    Tests to verify that getAllOAuthClientDetails api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/oauth_client_details_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_00388
    [Documentation]     Verify non-admin user can not GET all rows from “OAuth Client Details”  via api so that when the user call get {url}/uaa/api/oauth-client-details , the response should be 403 Forbidden.
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Get All OAuth Client Details
    Response Correct Code    ${FORBIDDEN_CODE}
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message
	Response Should Contain Property With Value     title    Forbidden
	Response Should Contain Property With Value     status    ${${FORBIDDEN_CODE}}
	Response Should Contain Property With Value     detail    Access is denied
	Response Should Contain Property With Value     path    /api/oauth-client-details
	Response Should Contain Property With Value     message    error.http.403