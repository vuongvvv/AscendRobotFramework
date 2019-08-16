*** Variables ***
${truemoney_status_url}           /crm-ms-payment-api/v1/api/truemoney/_tx_ref_id/status

*** Keywords ***
Get TrueMoney Status
    [Arguments]             ${tx_ref_id}
    ${check_status_uri}=    Replace String     ${truemoney_status_url}    _tx_ref_id    ${tx_ref_id}
    ${RESP}=           Get Request        ${RPP_SESSION}      ${check_status_uri}    headers=&{query_header}
    Set Test Variable       ${RESP}
