*** Settings ***
Resource    ../common/api_common.robot

*** Variables ***
${payment_url}    /payment/api/charge

*** Keywords ***
Post Payment Charge
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${payment_url}    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Payment Query
    [Arguments]    ${transaction_reference_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /payment/api/query?txRefId=${transaction_reference_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Payment Cancel
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${payment_url}/cancel    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}