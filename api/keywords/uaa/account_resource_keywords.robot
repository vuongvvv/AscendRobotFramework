*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get Account
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/account    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Save Account
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/account    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Change Password
    [Arguments]    ${password}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/account/change-password    data=${password}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Finish Password Reset
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/account/reset-password/finish    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Request Password Reset
    [Arguments]    ${mail}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/account/reset-password/init    data=${mail}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Social User Connection
    [Arguments]    ${provider_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/account/social-user-connection    params=providerId=${provider_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Activate Account
    [Arguments]    ${key}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/activate    params=key=${key}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Is Authenticated
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/authenticate    headers=&{gateway_header}
    Set Test Variable    ${RESP}