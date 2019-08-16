*** Settings ***
Resource      ../common/api_common.robot

*** Keywords ***
Post Sign In With Sdk
    [Arguments]    ${provider_id}    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/social/signin/${provider_id}    data=${data}    headers=&{BASIC_GATEWAY_HEADER}
    Set Test Variable    ${RESP}