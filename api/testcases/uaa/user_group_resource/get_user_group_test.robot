*** Settings ***
Documentation    Tests to verify that getUserGroup api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_group_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.userGroup.get,uaa.userGroup.list    AND    Get User Group Id    name.equals=${PROD_TEST_USER_GROUP}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05121
    [Documentation]     [UAA][getUserGroup] User with permission uaa.userGroup.get can send GET /api/user-groups/{id}
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Get User Group    ${USER_GROUP_ID}
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain Property With String Or Null     description
	Response Should Contain Property With Value    id    ${USER_GROUP_ID}
	Response Should Contain Property With String Value     name
	Response Should Contain Property Value Is String Or Empty List     permissionGroups
	Response Should Contain Property Value Is String Or Empty List     permissions
	Response Should Contain Property Value Is String Or Empty List     users