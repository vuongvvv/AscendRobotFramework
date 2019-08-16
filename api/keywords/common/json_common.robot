*** Settings ***
Library    Collections
Library    String
*** Keywords ***
Get Property Value From Json By Index
    [Arguments]    ${property}    ${index}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    [Return]    @{property_values}[${index}]

Is Property With Value Exist In Json
    [Arguments]    ${property}    ${value}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${return_value}=    Run Keyword And Return Status    List Should Contain Value    ${property_values}    ${value}
    [Return]    ${return_value}

Get Property Value By Another Property Value
    [Arguments]    ${property}    ${value}    ${return_property}
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    ${matched_value_index}=    Get Index From List    ${property_values}    ${value}
    @{return_property_values}=    Get Value From Json    ${RESP.json()}    $.${return_property}
    [Return]    @{return_property_values}[${matched_value_index}]

Generate Json From Json Property Value
    [Arguments]    ${property}    ${generated_key}
    ${returnValue}=    Set Variable    {
    @{property_values}=    Get Value From Json    ${RESP.json()}    $.${property}
    :FOR    ${value}    IN    @{property_values}
    \    ${returnValue}=    Catenate    SEPARATOR=,{    ${returnValue}    "${generated_key}":${value}}
    ${returnValue}=    Replace String    ${returnValue}    {,{    {
    [Return]    ${returnValue}