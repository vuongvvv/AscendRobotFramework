*** Settings ***
Documentation    Tests to verify that getAuditedEntities api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/javers_entity_audit_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.entityAudit.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_02800
    [Documentation]     [Point][getAuditedEntities] API return status 200 and return all entity correctly
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Get Audited Entities
    Response Correct Code    ${SUCCESS_CODE}