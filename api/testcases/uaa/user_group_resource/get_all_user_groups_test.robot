*** Settings ***
Documentation    Tests to verify that getAllUserGroups api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/user_group_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=uaa.userGroup.list
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05119
    [Documentation]     [UAA][getAllUserGroups] User with permission uaa.userGroup.list can send GET /api/user-groups
    [Tags]    Regression     Medium    Sanity    Smoke    E2E
    Get All User Groups
    Response Correct Code    ${SUCCESS_CODE}
	Response Should Contain All Property Values Are String Or Null     .description
	Response Should Contain All Property Values Are Number     .id
	Response Should Contain All Property Values Are String     .name
	Response Should Contain All Property Values Are String Or Null     .permissionGroups
	Response Should Contain All Property Values Are String Or Null     .permissions
	Response Should Contain All Property Values Are String Or Null     .users