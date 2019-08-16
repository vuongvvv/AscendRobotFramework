*** Settings ***
Documentation    Tests to verify that getHistories api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/javers_entity_audit_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.entityAudit.actAsAdmin    AND    Prepare Entity Id    ${entity_type}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${entity_type}    Point
*** Test Cases ***
TC_O2O_02803
    [Documentation]    [Point][getHistories] API return history list correctly when request with correct entityId and entityType
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Histories    entityId=${ENTITY_ID}&entityType=${entity_type}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Equal To Value    .entityId    ${ENTITY_ID}
    Response Should Contain All Property Values Equal To Value    .entityType    ${entity_type}