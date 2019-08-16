*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get All Campaign Rule Trackings
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /point/api/campaignRuleTrackings    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}