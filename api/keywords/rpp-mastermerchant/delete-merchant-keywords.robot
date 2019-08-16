*** Settings ***
Resource     ../../resources/import.robot

*** Keywords ***
Call Delete Merchant API
    [Arguments]    ${id}
    Create Session    delete_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${id}=    Convert To String    ${id}
    ${delete_merchant_uri}=    Replace String    ${delete_merchant_uri}    {id}    ${id}
    ${response}=    Delete Request    delete_merchant    ${delete_merchant_uri}    headers=${headers}
    Set Test Variable    ${response}


Verify Status Should Be Equal '${status}'
    Create Search String For Search Merchant
    Add Query String 'Id' With '${new_id}' For Search Merchant
    Call Search Merchant API
    Response Field 'content[0].status' Should Be Equal '${status}'


