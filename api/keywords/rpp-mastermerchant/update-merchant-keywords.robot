*** Settings ***
Resource     ../../resources/import.robot

*** Keywords ***
Call Update Merchant API
    [Arguments]    ${jsonbody}
    Create Session    put_search_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${response}=    Put Request    put_search_merchant    ${update_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${response.status_code} != 200    Set Test Variable    ${json_resp}    ${response.json()}
    Set Test Variable    ${response}    ${response}

Create New Merchant with gender is female
    Prepare Json Request    ${create_merchant_api}
    Prepare Merchant Info
    Call Create Merchant API With JSON Body    ${request}
    Save 'id' As 'new_id' From Response