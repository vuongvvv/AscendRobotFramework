*** Settings ***
Documentation    Tests to verify that activateAccount api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${wrong_activation_key}    wrongActivationKey

*** Test Cases ***
TC_O2O_07840
    [Documentation]     [uaa][activateAccount] Request with wrong activation key returns 500
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Get Activate Account    ${wrong_activation_key}
    Response Correct Code    ${INTERNAL_SERVER_CODE}
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message
	Response Should Contain Property With Value     title    No user was found for this reset key
	Response Should Contain Property With Value     status    ${${INTERNAL_SERVER_CODE}}
	Response Should Contain Property With Value     message    error.null
	Response Should Contain Property With Empty Value    params