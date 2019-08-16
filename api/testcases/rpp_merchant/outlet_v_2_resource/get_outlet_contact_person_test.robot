*** Settings ***
Documentation    Tests to verify that getOutletContactPerson work correctly
Resource    ../../../resources/init.robot
Resource    ../../../keywords/common/dummy_data_common.robot
Resource    ../../../keywords/rpp_merchant/outlet_v_2_resource_keywords.robot
Test Teardown    Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${merchant_TMN_TY_json_data}    ../../resources/testdata/rpp-merchant/merchant_resource/create_rpp_merchant_TMN_TY_data.json
${outlet_json_data_with_2_contact}    ../../resources/testdata/rpp-merchant/outlet_v_2_resource/create_rpp_outlet_with_2_contact_person_data.json

*** Test Cases ***
TC_O2O_07564
    [Documentation]    [ContactPersonV2] Verify API returns 200 and multi Contact Persons from outlet
    [Tags]    Regression    High    UnitTest    Smoke    Minos-2019S08
    Create Merchant And Outlet With Dummy Data    ${merchant_TMN_TY_json_data}    ${outlet_json_data_with_2_contact}
    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    merchant.outlet.read
    Get Outlet Contact Person    ${OUTLET_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Verify The Successful Response Of Contact Persons   0
    Verify The Successful Response Of Contact Persons   1

TC_O2O_07565
    [Documentation]    [ContactPersonV2] Verify API returns 200 and a Contact Person when outlet has only 1 Contact Person
    [Tags]    Regression    High    UnitTest    Smoke    Minos-2019S08    Sanity
    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    merchant.outlet.read
    Get Outlet Id From List Of Outlets By Index   0
    Get Outlet Contact Person    ${OUTLET_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    [0].refType    outlet

