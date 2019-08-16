*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Post Send Merchant Transaction To Point Issuer
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /point/api/process/send-sum-transaction-to-issuer    headers=&{gateway_header}
    Set Test Variable    ${RESP}