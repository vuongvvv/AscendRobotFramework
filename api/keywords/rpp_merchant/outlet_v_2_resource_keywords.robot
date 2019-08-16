*** Settings ***
Resource    ../common/api_common.robot
Resource    ../rpp_merchant/merchant_resource_keywords.robot

*** Variables ***
${random_length}    7

*** Keywords ***
Get Search Outlet
    [Arguments]    ${params_uri}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /rpp-merchant/api/v2/outlets    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Search Outlet By Id
    [Arguments]    ${outlet_id}    ${fields}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /rpp-merchant/api/v2/outlets/${outlet_id}    params=${fields}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Outlet Contact Person
    [Arguments]    ${id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /rpp-merchant/api/v2/outlets/${id}/contactPersons    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Create Outlets And Address Ref Merchant Id
    [Arguments]    ${json_body}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /rpp-merchant/api/v2/outlets    data=${json_body}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Create Merchant And Outlet With Dummy Data
    [Arguments]    ${merchant_json_data}    ${outlet_json_data}
    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    merchant.merchant.write,merchant.outlet.write
    ${random_string}=    Generate Random String    ${random_length}    [NUMBERS]
    Read Json From File    ${merchant_json_data}
    Update Json Data    $.merchantId    ${random_string}
    Update Json Data    $.'trueyouId'    ${random_string}
    Post Create Merchant    ${json_dummy_data}
    Response Correct Code    ${CREATED_CODE}
    @{merchant_sequence_id}    Get Value From Json    ${RESP.json()}    $.id
    Read Json From File    ${outlet_json_data}
    Update Json Data    $.outlets[0].merchantId    ${merchant_sequence_id[0]}
    Post Create Outlets And Address Ref Merchant Id    ${json_dummy_data}
    Response Correct Code    ${CREATED_CODE}
    @{outlet_id}    Get Value From Json    ${RESP.json()}    $.outlets[0].id
    ${OUTLET_ID}    Set Variable    ${outlet_id[0]}
    Delete Created Client And User Group
    Set Test Variable    ${OUTLET_ID}

Get Outlet Id From List Of Outlets By Index
    [Arguments]    ${index}    ${params_uri}=page=0&size=12&sort=id,desc
    Get Search Outlet    ${params_uri}
    ${OUTLET_ID}    Get Property Value From Json By Index    content[0].id    ${index}
    Set Test Variable    ${OUTLET_ID}

Verify The Successful Response Of Contact Persons
    [Arguments]    ${index}
    Response Should Contain Property With Value    [${index}].titleId    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["titleId"]}
    Response Should Contain Property With Value    [${index}].titleOtherName    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["titleOtherName"]}
    Response Should Contain Property With Value    [${index}].firstNameTh    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["firstNameTh"]}
    Response Should Contain Property With Value    [${index}].lastNameTh    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["lastNameTh"]}
    Response Should Contain Property With Value    [${index}].firstNameEn    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["firstNameEn"]}
    Response Should Contain Property With Value    [${index}].lastNameEn    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["lastNameEn"]}
    Response Should Contain Property With Value    [${index}].refType    outlet
    Response Should Contain Property With Value    [${index}].phoneNo    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["phoneNo"]}
    Response Should Contain Property With Value    [${index}].mobileNo    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["mobileNo"]}
    Response Should Contain Property With Value    [${index}].email    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["email"]}
    Response Should Contain Property With Value    [${index}].thaiId    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["thaiId"]}
    Response Should Contain Property With Value    [${index}].passportNo    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["passportNo"]}
    Response Should Contain Property With Value    [${index}].birthDate    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["birthDate"]}
    Response Should Contain Property With Value    [${index}].gender    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["gender"]}
    Response Should Contain Property With Value    [${index}].occupation    ${json_dummy_data["outlets"][0]["contactPersons"][${index}]["occupation"]}

Verify The Successful Response Of Getting Outlet With Dummy Data
    [Arguments]    ${index}=0
    Response Should Contain Property With Value    outletId    ${json_dummy_data["outlets"][${index}]["outletId"]}
    Response Should Contain Property With Value    tmnOutletId    ${json_dummy_data["outlets"][${index}]["tmnOutletId"]}
    Response Should Contain Property With Value    'trueyouId'    ${json_dummy_data["outlets"][${index}]["trueyouId"]}
    Response Should Contain Property With Value    outletNameTh    ${json_dummy_data["outlets"][${index}]["outletNameTh"]}
    Response Should Contain Property With Value    outletNameEn    ${json_dummy_data["outlets"][${index}]["outletNameEn"]}
    Response Should Contain Property With Value    outletDetail    ${json_dummy_data["outlets"][${index}]["outletDetail"]}
    Response Should Contain Property With Value    headQuarter    ${json_dummy_data["outlets"][${index}]["headQuarter"]}
    Response Should Contain Property With Value    registerChannel    ${json_dummy_data["outlets"][${index}]["registerChannel"]}
    Response Should Contain Property With Value    franchisee    ${json_dummy_data["outlets"][${index}]["franchisee"]}
    Response Should Contain Property With Value    saleId    ${json_dummy_data["outlets"][${index}]["saleId"]}
    Response Should Contain Property With Value    addresses.[0].address    ${json_dummy_data["outlets"][${index}]["addresses"][0]["address"]}
    Response Should Contain Property With Value    addresses.[0].road    ${json_dummy_data["outlets"][${index}]["addresses"][0]["road"]}
    Response Should Contain Property With Value    addresses.[0].postCode    ${json_dummy_data["outlets"][${index}]["addresses"][0]["postCode"]}
    Response Should Contain Property With Value    addresses.[0].latitude    ${json_dummy_data["outlets"][${index}]["addresses"][0]["latitude"]}
    Response Should Contain Property With Value    addresses.[0].longtitude    ${json_dummy_data["outlets"][${index}]["addresses"][0]["longtitude"]}
    Response Should Contain Property With Value    addresses.[0].addressType    ${json_dummy_data["outlets"][${index}]["addresses"][0]["addressType"]}
    Response Should Contain Property With Value    contactPersons.[0].titleId    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["titleId"]}
    Response Should Contain Property With Value    contactPersons.[0].titleOtherName    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["titleOtherName"]}
    Response Should Contain Property With Value    contactPersons.[0].firstNameTh    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["firstNameTh"]}
    Response Should Contain Property With Value    contactPersons.[0].lastNameTh    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["lastNameTh"]}
    Response Should Contain Property With Value    contactPersons.[0].firstNameEn    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["firstNameEn"]}
    Response Should Contain Property With Value    contactPersons.[0].lastNameEn    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["lastNameEn"]}
    Response Should Contain Property With Value    contactPersons.[0].phoneNo    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["phoneNo"]}
    Response Should Contain Property With Value    contactPersons.[0].mobileNo    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["mobileNo"]}
    Response Should Contain Property With Value    contactPersons.[0].email    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["email"]}
    Response Should Contain Property With Value    contactPersons.[0].thaiId    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["thaiId"]}
    Response Should Contain Property With Value    contactPersons.[0].passportNo    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["passportNo"]}
    Response Should Contain Property With Value    contactPersons.[0].birthDate    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["birthDate"]}
    Response Should Contain Property With Value    contactPersons.[0].gender    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["gender"]}
    Response Should Contain Property With Value    contactPersons.[0].occupation    ${json_dummy_data["outlets"][${index}]["contactPersons"][0]["occupation"]}

Verify Bad Request Response When Creating Outlet With Merchant Not Exist
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    fieldErrors..message    Merchant with id = 212121212121 not found.
    Response Should Contain Property With Value    type    http://www.jhipster.tech/problem/constraint-violation
    Response Should Contain Property With Value    title    Method argument not valid
    Response Should Contain Property With Value    path    /api/v2/outlets
    Response Should Contain Property With Value    message    error.validation
    Response Should Contain Property With Value    fieldErrors..objectName    outlet
    Response Should Contain Property With Value    fieldErrors..field    merchantId

Verify Bad Request Response When Getting Outlet Not Exist
    [Arguments]    ${outlet_id}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    fieldErrors..message    outlet id not found
    Response Should Contain Property With Value    fieldErrors..field    Outlet ID : ${outlet_id}
    Response Should Contain Property With Value    type    http://www.jhipster.tech/problem/constraint-violation
    Response Should Contain Property With Value    title    Method argument not valid
    Response Should Contain Property With Value    path    /api/v2/outlets/${outlet_id}
    Response Should Contain Property With Value    message    error.validation
    Response Should Contain Property With Value    fieldErrors..objectName    outlet

