*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get Active Profiles
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /payment/api/profile-info    headers=&{gateway_header}
    Set Test Variable    ${RESP}