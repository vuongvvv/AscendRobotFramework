*** Settings ***
Resource    ../common/api_common.robot

*** Variables ***
${sms_audiences_url}    /notification/api/sms/audiences
*** Keywords ***
Get All SMS Audiences
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${sms_audiences_url}    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}