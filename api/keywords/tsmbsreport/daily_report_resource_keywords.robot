*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Get Send Daily Report
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /tsmbsreport/api/daily-report    headers=&{gateway_header}
    Set Test Variable    ${RESP}