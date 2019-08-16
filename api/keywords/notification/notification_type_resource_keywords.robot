*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get All Notification Types
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /notification/api/types    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Notification Type
    [Arguments]    ${notification_type_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /notification/api/types/${notification_type_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Notification Type Terms
    [Arguments]    ${notification_type_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /notification/api/types/${notification_type_id}/terms    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get All Messages By Merchant
    [Arguments]    ${type_id}    ${merchant_id}    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /notification/api/types/${type_id}/merchants/${merchant_id}/messages    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP} 

Post Create Notification Type
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /notification/api/types    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Update Notification Type
    [Arguments]    ${data}
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/types    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Update Notification Type Terms
    [Arguments]    ${notification_type_id}    ${data}
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/types/${notification_type_id}/terms    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Delete Notification Type
    [Arguments]    ${notification_type_id}
    ${RESP}=    Delete Request    ${GATEWAY_SESSION}    /notification/api/types/${notification_type_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}