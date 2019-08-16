*** Settings ***
Documentation    Tests to verify that getAuditedEntities api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/javers_entity_audit_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.entityAudit.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_01581
    [Documentation]    [API] [SMS] [History Activity Log] User with "notification.entityAudit.actAsAdmin" permission request "GET: /api/audits/entity/all" api returns 200
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Audited Entities
    Response Correct Code    ${SUCCESS_CODE}