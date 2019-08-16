*** Settings ***
Documentation    Tests to verify that search campaign api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/common/dummy_data_common.robot
Resource    ../../../keywords/project/project_resource_keywords.robot
Resource    ../../../keywords/promotion/campaign_resource_keywords.robot

Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission   ${ROLE_USER}    ${ROLE_USER_PASSWORD}    scope=camp.camp.r    AND    Get Test Data Project Id
Test Teardown     Run Keywords    Delete Created Client And User Group     AND      Delete All Sessions

*** Variables ***
 ${project_name}    Test campaign
 ${project_code}    Test_campaign
 ${project_description}     Test for Campaign
 ${create_campaign_gencoupon_json_data}    ../../../api/resources/testdata/promotion/create_campaign_gencoupon.json
 ${search_to_generate_coupon_json_data}   ../../../api/resources/testdata/promotion/search_to_generate_coupon.json
 ${customerId_length}   10
 ${refcode_length}    12
 ${action}      Viewing

*** Test Cases ***
TC_O2O_07092
    [Documentation]  To verify response and result when user search campaign
    [Tags]  ASCO2O-6   Hawkeye-2019S01   Regression    High    E2E   Smoke
    Post Create Project     {"name": "${project_name}","code": "${project_code}","description": "${project_description}"}
    Get Created ProjectID From Response
    ${refCode} =	Generate Random String	${refcode_length}
    Read Json From File   ${create_campaign_gencoupon_json_data}
    Update Json Data     $.refCode   ${refCode}
    Post Create Campaign     ${json_dummy_data}  ${project_id}
    Response Correct Code    ${CREATED_CODE}
    Get Created Gencoupon CampaignID From Response
    ${customerId} =	Generate Random String	${customerId_length}  [NUMBERS]
    Read Json From File   ${search_to_generate_coupon_json_data}
    Update Json Data    $.attribute.customerId    ${customerId}
    Post Search campaign    ${json_dummy_data}  ${project_id}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    $.actions..action.action   GEN_COUPON
    Delete Campaign    ${gen_campaign_id}    ${project_id}
    Delete Project  ${project_id}

TC_O2O_08588
    [Documentation]  To verify response and result when user search campaign with invalid value
    [Tags]    ASCO2O-236   Hawkeye-2019S02   Regression    High    Sanity
    Post Search campaign    { "channel": "tsm", "attribute": { "action": "viewing", "customerId": "00001" } }    ${TEST_DATA_PROJECT_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Empty Value    $.actions