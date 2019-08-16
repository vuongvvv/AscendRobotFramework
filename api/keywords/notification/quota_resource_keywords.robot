*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get Quota Remaining
    [Arguments]    ${type_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /notification/api/types/${type_id}/remaining-quota    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Reset Merchant Quota Remaining
    [Arguments]    ${type_id}
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/types/${type_id}/remaining-reset    headers=&{gateway_header}
    Set Test Variable    ${RESP}