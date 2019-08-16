*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Put Process SMS Delivery
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/process/read-delivery-report    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Process Redeem Quota
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/process/redeem-quota    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Process Update Message Status
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /notification/api/process/update-status    headers=&{gateway_header}
    Set Test Variable    ${RESP}