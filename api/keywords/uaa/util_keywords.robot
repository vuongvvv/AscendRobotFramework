*** Settings ***
Resource    ../common/api_common.robot

*** Keywords ***
Delete Reset All Cache
    ${RESP}=    Delete Request    ${GATEWAY_SESSION}    /uaa/api/cache/clear-all    headers=&{gateway_header}
    Set Test Variable   ${RESP}