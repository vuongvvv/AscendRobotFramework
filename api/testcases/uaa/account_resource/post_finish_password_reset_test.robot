*** Settings ***
Documentation    Tests to verify that finishPasswordReset api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${password_7_characters}    Passwor

*** Test Cases ***
TC_O2O_07838
    [Documentation]     [uaa][finishPasswordReset] Request with less than 8 characters password returns 400
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Post Change Password    { "key": "string", "newPassword": "${password_7_characters}" }
    Response Correct Code    ${BAD_REQUEST_CODE}
	Response Should Contain Property With Value     status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value     title    Incorrect password
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/invalid-password