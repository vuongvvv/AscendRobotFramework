*** Settings ***
Documentation    Tests to verify that updateUserGroup api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_group_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.userGroup.update,uaa.userGroup.list    AND    Get User Group Id    name.equals=${PROD_TEST_USER_GROUP}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05127
    [Documentation]     [UAA][updateUserGroup] User with permission uaa.userGroup.update can send PUT /api/user-groups
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Put Update User Group    { "id": ${USER_GROUP_ID},"name": "${PROD_TEST_USER_GROUP}", "description": null, "permissions": [], "users": [] }
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain Property With String Or Null     description
	Response Should Contain Property With Value     id    ${USER_GROUP_ID}
	Response Should Contain Property With Value     name    ${PROD_TEST_USER_GROUP}
	Response Should Contain Property Value Is String Or Empty List     permissionGroups
	Response Should Contain Property Value Is String Or Empty List     permissions
	Response Should Contain Property Value Is String Or Empty List     users