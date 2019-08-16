*** Settings ***
Documentation    Tests to verify that getAllCampaignRuleTrackings api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/common/log_common.robot
Resource    ../../../keywords/point/campaign_rule_tracking_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=point.campaignRuleTracking.list
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions    AND    Log Bug For Test Case

*** Test Cases ***
TC_O2O_05934
    [Documentation]     [Point][GetCampaignRuleTracking] Verify that API return 200 when user with permission point.campaignRuleTracking.list send the API
    [Tags]      Regression     Medium    Smoke    E2E    SanityExclude
    Get All Campaign Rule Trackings
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Number    .amount
    Response Should Contain All Property Values Are Number    .amountRemaining
    Response Should Contain All Property Values Are Number    .campaignId
    Response Should Contain All Property Values Are String    .campaignRule
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .key
    Response Should Contain All Property Values Are String    .thaiId
    Response Should Contain All Property Values Are Number    .version