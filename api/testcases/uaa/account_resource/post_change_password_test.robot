*** Settings ***
Documentation    Tests to verify that changePassword api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${password_31_characters}    Password31charsPassword31chars1

*** Test Cases ***
TC_O2O_07837
    [Documentation]     [uaa][changePassword] Request with more than 30 characters password returns 400
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Post Change Password    ${password_31_characters}
    Response Correct Code    ${BAD_REQUEST_CODE}
	Response Should Contain Property With Value     status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value     title    Incorrect password
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/invalid-password