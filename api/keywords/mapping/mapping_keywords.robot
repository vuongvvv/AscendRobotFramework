*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***    
Post Resolve Mapping Internal To External
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /mapping/api/reverse-mapping    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Update Mapping
    [Arguments]    ${data}
    Put Request    ${GATEWAY_SESSION}    /mapping/api/mappings    data=${data}    headers=&{gateway_header}