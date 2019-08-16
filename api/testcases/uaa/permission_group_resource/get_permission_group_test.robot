*** Settings ***
Documentation    Tests to verify that getPermissionGroup api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/permission_group_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.permissionGroup.get,uaa.permissionGroup.list    AND    Get Permission Group Id
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05111
    [Documentation]     [UAA][PermissionGroup] User with permission uaa.permissionGroup.get can send GET /api/permissions-groups/{id}
    [Tags]      Regression     Medium    Smoke    E2E    Sanity    UnitTest
    Get Permission Group    ${TEST_DATA_PERMISSION_GROUP_ID}
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain Property With String Or Null     description
	Response Should Contain Property With Value     id    ${TEST_DATA_PERMISSION_GROUP_ID}
	Response Should Contain Property With String Value     name
	Response Should Contain All Property Values Are String Or Null     permissions..description
	Response Should Contain All Property Values Are Number     permissions..id
	Response Should Contain All Property Values Are String     permissions..name