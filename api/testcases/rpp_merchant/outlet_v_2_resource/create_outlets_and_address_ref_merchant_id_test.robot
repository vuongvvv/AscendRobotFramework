*** Settings ***
Documentation    Tests to verify that API createOutletsAndAddressRefMerchantId work correctly
Resource    ../../../resources/init.robot
Resource    ../../../keywords/common/dummy_data_common.robot
Resource    ../../../keywords/rpp_merchant/outlet_v_2_resource_keywords.robot
Test Teardown    Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${merchant_TMN_TY_json_data}    ../../resources/testdata/rpp-merchant/merchant_resource/create_rpp_merchant_TMN_TY_data.json
${outlet_json_data}    ../../resources/testdata/rpp-merchant/outlet_v_2_resource/create_rpp_outlet_data.json

*** Test Cases ***
TC_O2O_07659
    [Documentation]    [CreateOutletV2] Verify that POST /api/v2/outlets can create multiple outlets belonging to a merchant
    [Tags]    Regression    UnitTest
    Create Merchant And Outlet With Dummy Data    ${merchant_TMN_TY_json_data}    ${outlet_json_data}
    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    merchant.outlet.read,merchant.outlet.actAsAdmin
    Get Search Outlet By Id    ${OUTLET_ID}
    Verify The Successful Response Of Getting Outlet With Dummy Data


TC_O2O_07666
    [Documentation]    [CreateOutletV2] Verify that POST /api/v2/outlets request is rejected if any merchant does not exist
    [Tags]    Regression    UnitTest    Sanity
    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    merchant.merchant.write,merchant.outlet.write
    Read Json From File    ${outlet_json_data}
    Update Json Data    $.outlets[0].merchantId    212121212121
    Post Create Outlets And Address Ref Merchant Id    ${json_dummy_data}
    Verify Bad Request Response When Creating Outlet With Merchant Not Exist
