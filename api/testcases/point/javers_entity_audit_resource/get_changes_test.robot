*** Settings ***
Documentation    Tests to verify that getChanges api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/javers_entity_audit_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.entityAudit.actAsAdmin
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${entity_type}    Point
${limit}    10

*** Test Cases ***
TC_O2O_02801
    [Documentation]     [Point][getChanges] API return last change list for an entity class correctly
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Get Changes    ${entity_type}    ${limit}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Equal To Value    .entityType    ${entity_type}
    Response Should Have Number Of Records    ${limit}    .entityId