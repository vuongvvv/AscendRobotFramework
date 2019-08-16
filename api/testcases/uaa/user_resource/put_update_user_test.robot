*** Settings ***
Documentation    Tests to verify that updateUser api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_user_id}    999999
*** Test Cases ***
TC_O2O_08054
    [Documentation]     [uaa][updateUser] Request with already exist email returns 400
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Put Update User    { "id": ${not_exist_user_id}, "login": "${ROLE_USER}", "firstName": "robot_test", "lastName": "robot_test", "email": "robot_test@gmail.com", "mobile": "66639202325", "activated": false, "langKey": "en", "authorities": [ "ROLE_USER" ], "createdBy": null, "createdDate": null, "lastModifiedBy": null, "lastModifiedDate": null, "password": null }
    Response Correct Code    ${FORBIDDEN_CODE}
	Response Should Contain Property With Value     detail    Access is denied
	Response Should Contain Property With Value     message    error.http.403
	Response Should Contain Property With Value     path    /api/users
	Response Should Contain Property With Value     status    ${${FORBIDDEN_CODE}}
	Response Should Contain Property With Value     title    Forbidden
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message