*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get Features
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/features    headers=&{gateway_header}
    Set Test Variable    ${RESP}