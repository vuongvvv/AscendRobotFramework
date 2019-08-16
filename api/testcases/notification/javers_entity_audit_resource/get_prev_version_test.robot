*** Settings ***
Documentation    Tests to verify that getPrevVersion api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/javers_entity_audit_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.entityAudit.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${commit_version}    ${2}
${entity_id}    1
${entity_type}    NotificationType
*** Test Cases ***
TC_O2O_01579
    [Documentation]    [notification][getPrevVersion] User with "notification.entityAudit.actAsAdmin" permission can access the APIs to query the activity log on JV_SNAPSHOT table
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Prev Version    ${commit_version}    ${entity_id}    ${entity_type}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    commitVersion    ${${commit_version-1}}
    Response Should Contain Property With Value    entityId    ${entity_id}
    Response Should Contain Property With Value    entityType    ${entity_type}