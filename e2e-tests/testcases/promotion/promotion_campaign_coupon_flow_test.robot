*** Settings ***
Documentation   Given customers have products in their cart
...             And campaign is matched with products in their cart
...             When customers submit to pay
...             Then customers should get coupon
...             When customers want to use coupon with their condition
...             Then customers should get the benefit from their coupons
Resource        ../../../api/resources/init.robot
Resource        ../../../api/keywords/common/dummy_data_common.robot
Resource        ../../../api/keywords/project/project_resource_keywords.robot
Resource        ../../../api/keywords/promotion/campaign_resource_keywords.robot
Resource        ../../../api/keywords/promotion/redemption_tx_resource_keywords.robot
Resource        ../../../api/resources/testdata/promotion/create_campaign_usecoupon.json
Resource        ../../../api/resources/testdata/promotion/create_campaign_gencoupon.json
Resource        ../../../api/resources/testdata/promotion/search_to_generate_coupon.json
Resource        ../../../api/resources/testdata/promotion/redeem_to_generate_coupon.json
Resource        ../../../api/resources/testdata/promotion/search_to_use_coupon.json
Resource        ../../../api/resources/testdata/promotion/redeem_to_use_coupon.json
Test Setup     Generate Gateway Header With Scope and Permission   ${ROLE_USER}    ${ROLE_USER_PASSWORD}    scope=proj.proj.w,proj.proj.r,camp.camp.w,camp.capm.r
Test Teardown  Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
 ${create_campaign_gencoupon_json_data}    ../../../api/resources/testdata/promotion/create_campaign_gencoupon.json
 ${create_campaign_usecoupon_json_data}    ../../../api/resources/testdata/promotion/create_campaign_usecoupon.json
 ${search_to_generate_coupon_json_data}   ../../../api/resources/testdata/promotion/search_to_generate_coupon.json
 ${redeem_to_generate_coupon_json_data}  ../../../api/resources/testdata/promotion/redeem_to_generate_coupon.json
 ${search_to_use_coupon_json_data}   ../../../api/resources/testdata/promotion/search_to_use_coupon.json
 ${redeem_to_use_coupon_json_data}   ../../../api/resources/testdata/promotion/redeem_to_use_coupon.json
 ${refcode_length}    12
 ${customerId_length}   10
 ${refCode_usecoupon}   usecoupon4
 ${project_name}    WeMall API Test
 ${project_code}    WeMall_API
 ${project_description}     Test for WeMall
 ${startDate}     2019-03-30T17:00:00Z
 ${endDate}      2019-12-31T16:59:00Z

*** Test Cases ***
TC_O2O_07645
    [Documentation]  {API, E2E} To verify response and result when user create a new project by API
    [Tags]  Regression    High    E2E   Sanity
    Post Create Project     {"name": "${project_name}","code": "${project_code}","description": "${project_description}"}
    Response Correct Code    ${CREATED_CODE}
    Response Should Contain Property With String Value  $.id
    Response Should Contain Property With Value  $.name   ${project_name}
    Response Should Contain Property With Value  $.code   ${project_code}
    Response Should Contain Property With Value  $.description    ${project_description}
    Get Created ProjectID From Response

TC_O2O_07646
    [Documentation]  {API, E2E} To verify response and result when user create a new campaign for gencoupon
    [Tags]  Regression    High    E2E   Sanity
    ${refCode} =	Generate Random String	${refcode_length}
    Read Json From File   ${create_campaign_gencoupon_json_data}
    Update Json Data     $.refCode   ${refCode}
    Update Json Data     $.startDate   ${startDate}
    Update Json Data     $.endDate   ${endDate}
    Post Create Campaign     ${json_dummy_data}  ${project_id}
    Response Correct Code    ${CREATED_CODE}
    Response Should Contain Property With Value  $.name  gencoupon
    Response Should Contain Property With Value  $.description  generate coupon
    Response Should Contain Property With Value  $.startDate   ${startDate}
    Response Should Contain Property With Value  $.endDate    ${endDate}
    Response Should Contain Property With Value  $.refCode   ${refCode}
    Response Should Contain Property With Value  $.projectId    ${project_id}
    Get Created Gencoupon CampaignID From Response

TC_O2O_07647
    [Documentation]  {API, E2E} To verify response and result when user create a new campaign for usecoupon
    [Tags]  Regression    High    E2E   Sanity
    Read Json From File   ${create_campaign_usecoupon_json_data}
    Update Json Data     $.refCode   ${refCode_usecoupon}
    Update Json Data     $.startDate   ${startDate}
    Update Json Data     $.endDate   ${endDate}
    Post Create Campaign     ${json_dummy_data}  ${project_id}
    Response Should Contain Property With Value  $.name   usecoupon
    Response Should Contain Property With Value  $.description  use coupon
    Response Should Contain Property With Value  $.startDate   ${startDate}
    Response Should Contain Property With Value  $.endDate    ${endDate}
    Response Should Contain Property With Value  $.refCode   ${refCode_usecoupon}
    Response Should Contain Property With Value  $.projectId    ${project_id}
    Get Created Usecoupon CampaignID From Response

TC_O2O_07648
    [Documentation]  {API, E2E} To verify response and result when user search a campaign to generate coupon
    [Tags]  Regression    High   E2E    Sanity
    ${customerId} =	Generate Random String	${customerId_length}  [NUMBERS]
    Read Json From File   ${search_to_generate_coupon_json_data}
    Update Json Data    $.attribute.customerId    ${customerId}
    Post Search campaign    ${json_dummy_data}  ${project_id}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    $.actions..action.action   GEN_COUPON
    Get Created Coupon RefCode From Response
    Get Created CustomerId From Response

TC_O2O_07649
    [Documentation]  {API, E2E} To verify response and result when user redeem to generate coupon code
    [Tags]  Regression    High   E2E    Sanity
    Read Json From File  ${redeem_to_generate_coupon_json_data}
    Update Json Data     $.campaignCode   ${coupon_refcode}
    Update Json Data     $.attribute.customerId   ${customer_id}
    Post Redeem To Generate Coupon  ${json_dummy_data}  ${project_id}
    Response Correct Code    ${CREATED_CODE}
    Response Should Contain Property With Value    $.status    COMPLETE
    Get Created Coupon Code From Response

TC_O2O_07650
    [Documentation]  {API, E2E} To verify response and result when user searches coupon code
    [Tags]  Regression    High   E2E    Sanity
    Read Json From File  ${search_to_use_coupon_json_data}
    Update Json Data     $.couponCode    ${coupon_code}
    Update Json Data     $.attribute.customerId   ${customer_id}
    Get Search Coupon   ${json_dummy_data}  ${project_id}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value   $.actions..campaign.refCode   ${refCode_usecoupon}

TC_O2O_07651
    [Documentation]  {API, E2E} To verify response and result when user redeems coupon
    [Tags]  Regression    High   E2E    Sanity
    Read Json From File    ${redeem_to_use_coupon_json_data}
    Update Json Data     $.campaignCode   ${refCode_usecoupon}
    Update Json Data     $.attribute.customerId   ${customer_id}
    Update Json Data     $.couponCode    ${coupon_code}
    Post Redeem To Use Coupon  ${json_dummy_data}  ${project_id}
    Response Correct Code    ${CREATED_CODE}
    Response Should Contain Property With Value     $.actionTxs..status    COMPLETE
    Delete Campaign     ${use_campaign_id}      ${project_id}
    Delete Campaign     ${gen_campaign_id}      ${project_id}
    Delete Project      ${project_id}