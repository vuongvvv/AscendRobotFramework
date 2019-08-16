*** Settings ***
Resource    ../common/api_common.robot
Resource    ../common/dummy_data_common.robot

*** Variables ***
${merchants_api}    /rpp-merchant/api/merchants

*** Keywords ***
Post Create Merchant
    [Arguments]    ${json_body}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${merchants_api}    data=${json_body}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

