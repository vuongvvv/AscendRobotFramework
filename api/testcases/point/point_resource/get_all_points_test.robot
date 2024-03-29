*** Settings ***
Documentation    Tests to verify that getAllPoints api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/point_resource_keywords.robot
Resource    ../../../keywords/common/log_common.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.point.list    AND    Prepare Point Test Data
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_04913
    [Documentation]     [Point][getAllPoints] Request with "equals" filter and "thaiId" field with user with "point.point.list" permission returns 200 with correct data
    [Tags]      Regression     Medium    SanityExclude    E2E
    Get All Points    thaiId.equals=${THAI_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Equal To Value    .thaiId    ${THAI_ID}