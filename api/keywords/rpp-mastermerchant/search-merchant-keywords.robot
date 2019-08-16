*** Settings ***
Resource    ../../resources/import.robot

*** Keywords ***
Add Query String '${key}' With '${value}' For Search Merchant
    Set To Dictionary    ${params_dict}    ${key}=${value}

Call Search Merchant API
     Create Session    get_search_merchant    ${egg_api_url}    disable_warnings=${1}
     ${headers}=    Set header
     ${response}=    Get Request    get_search_merchant    ${search_merchant_uri}    ${headers}    params=${params_dict}
 
     Set Test Variable    ${response}

Create Search String For Search Merchant
    ${params_dict}=    Create Dictionary
    Set Test Variable    ${params_dict}