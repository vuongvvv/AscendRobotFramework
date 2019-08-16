*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Post Request Otp Of Truemoney Wallet
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /payment/api/wallet/otp    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Verify Otp Of Truemoney Wallet
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /payment/api/wallet/otp/verify    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}