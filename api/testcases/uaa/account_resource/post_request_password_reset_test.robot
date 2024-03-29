*** Settings ***
Documentation    Tests to verify that requestPasswordReset api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_email}    robot_not_exist_email@gmail.com

*** Test Cases ***
TC_O2O_07839
    [Documentation]     [uaa][requestPasswordReset] Request with not exist email returns 400
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Post Request Password Reset    ${not_exist_email}
    Response Correct Code    ${BAD_REQUEST_CODE}
	Response Should Contain Property With Value     status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value     title    Email address not registered
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/email-not-found