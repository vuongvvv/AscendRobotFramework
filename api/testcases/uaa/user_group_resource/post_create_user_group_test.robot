*** Settings ***
Documentation    Tests to verify that createUserGroup api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_group_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.userGroup.create,uaa.userGroup.list    AND    Get User Group Id    name.equals=${PROD_TEST_USER_GROUP}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_08042
    [Documentation]     [UAA][createUserGroup] Request with duplicated "name" returns 400
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Post Create User Group    { "id": ${USER_GROUP_ID},"name": "${PROD_TEST_USER_GROUP}", "description": null, "permissions": [], "users": [] }
    Response Correct Code    ${BAD_REQUEST_CODE}
	Response Should Contain Property With Value     entityName    userGroup
	Response Should Contain Property With Value     errorKey    idexists
	Response Should Contain Property With Value     message    error.idexists
	Response Should Contain Property With Value     params    userGroup
	Response Should Contain Property With Value     status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value     title    A new userGroup cannot already have an ID
	Response Should Contain Property With Value     type    http://www.jhipster.tech/problem/problem-with-message