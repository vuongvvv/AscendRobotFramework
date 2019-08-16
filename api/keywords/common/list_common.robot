*** Variables ***
${number_regex}    ^\\d+$
*** Keywords ***
Sort List Items
    [Arguments]    ${list}    ${sort_option}
    Sort List    ${list}   
    Run Keyword If    '${sort_option}' != 'ASC'    Reverse List    ${list}

All Items In List Are Number
    [Arguments]    ${list}
    :FOR    ${property_value}    IN    @{list}
    \    Should Match Regexp    ${property_value}    ${number_regex}

All Items In List Match Regex
    [Arguments]    ${list}    ${regex}
    :FOR    ${property_value}    IN    @{list}
    \    ${string_value}=    Convert To String    ${property_value}
    \    Should Match Regexp    ${string_value}    ${regex}

List Should Be String Or Empty
    [Arguments]    ${list}
    ${is_empty_list}=    Run Keyword And Return Status    Should Be Empty    ${list}
    Run Keyword If    ${is_empty_list}
    ...    Should Be Empty    ${list}
    ...    ELSE
    ...    All Items In List Match Regex    ${list}    \\w+