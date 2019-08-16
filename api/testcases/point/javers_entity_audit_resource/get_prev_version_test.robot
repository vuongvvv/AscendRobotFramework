*** Settings ***
Documentation    Tests to verify that getPrevVersion api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/javers_entity_audit_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.entityAudit.actAsAdmin    AND    Prepare Entity Id    ${entity_type}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${commit_version}    ${2}
${entity_type}    Point

*** Test Cases ***
TC_O2O_02802
    [Documentation]    [point][getPrevVersion] When request API with commitVersion, entityId, entityType, API return previous version correctly.
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Prev Version    commitVersion=${commit_version}&entityId=${ENTITY_ID}&entityType=${entity_type}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    commitVersion    ${${commit_version-1}}
    Response Should Contain Property With Value    entityId    ${ENTITY_ID}
    Response Should Contain Property With Value    entityType    com.ascendcorp.o2o.point.domain.${entity_type}