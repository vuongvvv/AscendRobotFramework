*** Settings ***
Resource    ../common/api_common.robot

*** Variables ***
${payment_transaction}    /paymenttransaction/api/transactions

*** Keywords ***
Post Create Payment Transaction
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${payment_transaction}    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

#Data preparation
Generate Transaction Reference
    [Arguments]    ${length}
    ${random_string}=    Generate Random String    ${length}
    Set Test Variable    ${TRANSACTION_REFERENCE}    ${random_string}

Generate Transaction Date With Format
    [Arguments]    ${increment}    ${format}
    ${current_date_string}=    Get Current Date    time_zone=local    increment=${increment}    result_format=${format}    exclude_millis=False
    Set Test Variable    ${TRANSACTION_DATE}    ${current_date_string}    

Prepare Payment Transaction Test Data
    Generate Transaction Reference    255
    Generate Transaction Date With Format    -2 hours    %Y-%m-%dT%H:%M:%S.%fZ