*** Settings ***
Documentation    Tests to verify that signInWithSdk api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/social_resource_keywords.robot
Resource    ../../../keywords/common/log_common.robot
Test Setup    Generate Basic Authentication Header    ${PROD_TEST_CLIENT}    ${PROD_TEST_CLIENT}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions    AND    Log Bug For Test Case

*** Variables ***
${trueid_username}                  ${TRUE_ID_USER}
${trueid_password}                  ${TRUE_ID_USER_PASSWORD}
${trueid_login_url}                 ${API_HOST}/uaa/api/social/signin/${trueid_provider}
${trueid_provider}                  trueid
*** Test Cases ***
TC_O2O_04927
    [Documentation]     [UAA][signInWithSdk] Request with existing user returns 200 with user information updated in UAA database
    [Tags]      Regression     High    Smoke    E2E    SanityIgnoreBug
    Open Browser With Chrome Headless Mode    ${trueid_login_url}
    Login TrueID On Website    ${trueid_username}    ${trueid_password}
    Get Login Code And State
    Login TrueID Account
    Post Sign In With Sdk    ${trueid_provider}    {"trueIdAccessToken": "${RESPONSE_ACCESS_TOKEN}" }
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain Property With String Value     access_token
	Response Should Contain Property With Number String     expires_in
	Response Should Contain Property With Number String     iat
	Response Should Contain Property With String Value     jti
	Response Should Contain Property With String Value     refresh_token
	Response Should Contain Property With String Value     scope
	Response Should Contain Property With Value     token_type    bearer