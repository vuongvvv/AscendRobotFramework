*** Settings ***
Library    DateTime
Library    DatabaseLibrary
Library    String
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource     collection_keywords.robot
Resource    validation_common.robot
Resource    gateway_common.robot
Resource    list_common.robot

*** Variables ***
${number_regex}    ^\\d+$
${url_regex}    ^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$
${email_regex}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$
${bool_regex}    ^(?i)(true|false)$
@{auth}    hzD3NBkNhZSyldOFRg3p7UpEtEbhKf4l    qU8cBpmjWO0p4rNT

*** Keywords ***
Create Apigee Session
    Create Session    ${APIGEE_SESSION}    ${APIGEE_HOST}    verify=true

Generate Authorization Key
    [Arguments]    ${client_id}    ${client_secret}    ${encode}=Base64
    ${encode_string}=    Encode String To Bytes    ${client_id}:${client_secret}    ${encode}
    ${return_string}=    Get Line    ${encode_string}    0
    [Return]    ${return_string}
        
Send Request
    [Arguments]  ${req_data}
    ${uri}=  Get Safely Data From Dictionary  ${req_data}  uri  ${EMPTY}
    ${method}=  Get Safely Data From Dictionary  ${req_data}  method  GET
    ${body}=  Get Safely Data From Dictionary  ${req_data}  body  ${EMPTY}
    ${headers}=  Get Safely Data From Dictionary  ${req_data}  headers  ${EMPTY}
    ${params}=  Get Safely Data From Dictionary  ${req_data}  params  ${EMPTY}
    ${files}=  Get Safely Data From Dictionary  ${req_data}  files  ${EMPTY}
    ${method}=  Set Variable  ${method.lower()}
    ${RESP}=   Run Keyword If  '${method}'=='post'  Post Request  ${GATEWAY_SESSION}  ${uri}  data=${body}  params=${params}  headers=${headers}  files=${files}
    ...  ELSE IF  '${method}' == 'put'  Put Request   ${GATEWAY_SESSION}   ${uri}  data=${body}   params=${params}   files=${files}  headers=${headers}
    ...  ELSE IF  '${method}' == 'get'  Get Request  ${GATEWAY_SESSION}  ${uri}  headers=${headers}  params=${params}
    ...  ELSEIF  '${method}' == 'delete'  Delete Request  ${url}  ${header_request}
    ...   ELSE  Log to console  You should specified method.
    Set Suite Variable  ${RESP}

Response Correct Code
    [Arguments]                     ${resp_code}
    Should Be Equal As Strings      ${RESP.status_code}             ${resp_code}

Response Correct Message
    [Arguments]                     ${resp_data}
    ${output}=                      To Json                   ${RESP.content}       pretty_print=True
    Run Keyword If                  '${resp_data}'!=''        Should Contain        ${output}              ${resp_data}

Response Should Be Empty
    Should Be Equal    ${RESP.text}    []

Response Should Be Empty Body
    Should Be Empty    ${RESP.text}

Response Should Be String
    Should Be String    ${RESP.text}

Response Should Match With Database
    [Arguments]    ${property}    ${sql_query}
    @{database_results}=    Query     ${sql_query}
    @{database_list}=    Convert To List    @{database_results}
    Lists Should Be Equal    ${RESP.text}    @{database_list}

Response Should Contain Property With Value
    [Arguments]    ${property}    ${value}
    ${property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    List Should Contain Value    ${property_value}    ${value}

Response Should Contain Property Matches Regex
    [Arguments]    ${property}    ${regex}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${string_value}=    Convert To String    @{property_value}[0]
    Should Match Regexp    ${string_value}    ${regex}

Response Should Contain Property Matches Regex Or Null
    [Arguments]    ${property}    ${regex}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Match Regex Or Null    @{property_value}[0]    ${regex}

Response Should Contain Property With Number String Or Null
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Be Number Or Null    @{property_value}[0]

Response Should Contain Property With String Value
    [Arguments]    ${property}
    Response Should Contain Property Matches Regex    ${property}    \\w+

Response Should Contain Property With Number String
    [Arguments]    ${property}
    Response Should Contain Property Matches Regex    ${property}    ${number_regex}

Response Should Contain Property With Boolean Value
    [Arguments]    ${property}
    Response Should Contain Property Matches Regex    ${property}    ${bool_regex}

Response Should Contain Property With Integer Value
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${integer_value}=     Convert To Integer    @{property_value}[0]
    Should Be Equal    @{property_value}[0]    ${integer_value}

Response Should Contain Property With Empty Value
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Be Empty    @{property_value}

Response Should Contain Property With String Or Null
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Be String Or Null    @{property_value}[0]

Response Should Contain Property With Null Value
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Be Null    @{property_value}[0]

Response Should Contain Property With Email
    [Arguments]    ${property}
    Response Should Contain Property Matches Regex    ${property}    ${email_regex}

Response Should Contain Property With List Matches Regex
    [Arguments]    ${property}    ${regex}
    ${property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    All Items In List Match Regex    ${property_value}    ${regex}

Response Should Contain Property Value Include In List
    [Arguments]    ${property}    ${list}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${string_value}=    Convert To String    @{property_value}[0]
    List Should Contain Value    ${list}    ${string_value}

Response Should Contain Property Value Is List
    [Arguments]    ${property}    ${list}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Lists Should Be Equal    @{property_value}[0]    ${list}

Response Should Contain Property Value Is String Or Empty List
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    List Should Be String Or Empty    @{property_value}[0]

Response Should Contain All Property Values Are String
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be String    ${property_value}

Response Should Contain All Property Values Are String Or Null
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be String Or Null    ${property_value}

Response Should Contain All Property Values Are String Or Empty List
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    List Should Be String Or Empty    ${property_value}

Response Should Contain All Property Values Are Number
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    ${string_property_value}=    Convert To String    ${property_value}
    \    Should Match Regexp    ${string_property_value}    ${number_regex}

Response Should Contain All Property Values Are Integer
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be Equal As Numbers    ${property_value}    ${${property_value}}

Response Should Contain All Property Values Are Number Or Null
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be Number Or Null    ${property_value}

Response Should Contain All Property Values Match Regex
    [Arguments]    ${property}    ${regex}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    ${string_value}=    Convert To String    ${property_value}
    \    Should Match Regexp    ${string_value}    ${regex}

Response Should Contain All Property Values Match Regex Or Null
    [Arguments]    ${property}    ${regex}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Match Regex Or Null    ${property_value}    ${regex}

Response Should Contain All Property Values Are Url
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Match Regexp    ${property_value}    ${url_regex}

Response Should Contain All Property Values Are Sorted
    [Arguments]    ${property}    ${sort_option}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    ${sort_list}=    Copy List    ${property_values}
    Sort List Items    ${sort_list}    ${sort_option}
    Lists Should Be Equal    ${property_values}    ${sort_list}

Response Should Contain All Property Values Equal To Value
    [Arguments]    ${property}    ${value}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}    
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be Equal    ${property_value}    ${value}
    
Response Should Contain All Property Values Include In List
    [Arguments]    ${property}    ${list}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    List Should Contain Value    ${list}    ${property_value}

Response Should Contain All Property Values Are Boolean
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be Boolean    ${property_value}

Response Should Contain All Property Values Contain
    [Arguments]    ${property}    ${value}    ${ignore_case}=${False}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Contain    ${property_value}    ${value}    ignore_case=${ignore_case}

Response Should Contain All Property Values Are Email
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Match Regexp    ${property_value}    ${email_regex}

Response Should Contain All Property Values Are Null
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Should Be Null    ${property_value}

Response Should Contain All Date Values Later Than Or Equal
    [Arguments]    ${property}    ${expected_date}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Date Should Be Greater Or Equal    ${property_value}    ${expected_date}
    
Response Should Contain All Date Values Earlier Than Or Equal
    [Arguments]    ${property}    ${expected_date}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    Date Should Be Greater Or Equal    ${expected_date}    ${property_value}

Get Created ID
    ${get_id}=    Get Value From Json    ${RESP.json()}    $.id
    ${get_id}=    Get From List    ${get_id}    0
    Set Suite Variable    ${get_id}

Response Should Not Contain Property
    [Arguments]    ${property}
    @{property_value}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Be Empty    ${property_value}

Response Should Contain All Property Values Are List Of Numbers
    [Arguments]    ${property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    Should Not Be Empty    ${property_values}
    :FOR    ${property_value}    IN    @{property_values}
    \    All Items In List Are Number    ${property_value}

Response Should Have Number Of Records
    [Arguments]    ${expected_number_records}    ${property}=id
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${response_length}=    Get Length    ${property_values}
    Should Be Equal    ${${expected_number_records}}    ${${response_length}}