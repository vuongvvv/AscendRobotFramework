*** Settings ***
Resource    ../../resources/import.robot

*** Keywords ***

################################# GENERATE RANDOM #################################
Get Rand Numbers Only
    [Arguments]    ${length}
    ${rand_num}=    Generate Random String    ${length}    [NUMBERS]
    Set Test Variable    ${rand_num}    ${rand_num}

Get Rand Letters and Numbers
    [Arguments]    ${length}
    ${rand_str}=    Generate Random String    ${length}    [LETTERS][NUMBERS]
    Set Test Variable    ${rand_str}    ${rand_str}

################################# POST, PUT, GET, DELETE #################################
Create Search String For Call API
    ${params_dict}=    Create Dictionary
    Set Test Variable    ${params_dict}

Delete '${field}' For Request
    ${request}=    Delete Object From Json    ${request}    $..${field}
    Set Test Variable    ${request}


Prepare Json Request
    [Arguments]    ${template}
    ${request}=     Copy Dictionary    ${template}
    Set Test Variable    ${request}    ${request}


Save '${field_resp:[^\s.]+}' As '${field_var:[^\s.]+}' From Response
    ${response}=    To Json    ${response.text}
    ${value}=    Set Variable    ${response['${field_resp}']}
    Set Test Variable    ${${field_var}}    ${value}

Update '${field}' Is '${value}' For Request
    ${request}=    Update Value To Json    ${request}    $..${field}    ${value}
    Set Test Variable    ${request}


################################# VERIFICATION #################################
Http Response Should Be '${http_status}'
    ${status}=    Set Variable    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Integers    ${status}    ${http_status}

Response Field '${json_path}' Should Be Empty
    ${response.json}=    To Json    ${response.text}
    ${actual}=    Get Value From Json    ${response.json}    $.${json_path}
    Should Be Equal As Strings    ${actual[0]}    []

Response Field '${json_path}' Should Not Be Empty
    ${response.json}=    To Json    ${response.text}
    ${actual}=    Get Value From Json    ${response.json}    $.${json_path}
    ${actual}=    Convert To String    ${actual}
    Should Not Be Empty    ${actual}

Response Field '${json_path}' Should Be Equal '${expected}'
    ${response.json}=    To Json    ${response.text}
    ${actual}=    Get Value From Json    ${response.json}    $.${json_path}
    Should Be Equal As Strings    ${actual[0]}    ${expected}

Response Field '${json_path}' Should Not Be Equal '${value}'
    ${response.json}=    To Json    ${response.text}
    ${actual}=    Get Value From Json    ${response.json}    $.${json_path}
    Should Not Be Equal As Strings    ${actual[0]}    ${value}

Response Field '${json_path}' Should Be Contain '${expected}'
    ${response.json}=    To Json    ${response.text}
    ${actual}=    Get Value From Json    ${response.json}    $.${json_path}
    Get Lines Containing String    ${actual[0]}    ${expected}
