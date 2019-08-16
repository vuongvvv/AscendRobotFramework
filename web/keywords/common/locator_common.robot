*** Settings ***
Library    String
Library    Collections    
*** Variables ***

*** Keywords ***
Generate Element From Dynamic Locator
    [Arguments]    ${dynamic_locator}    @{list_value}
    ${index}=    Set Variable    ${0}
    :FOR    ${value}    IN    @{list_value}
    \    ${dynamic_locator}=    Replace String    ${dynamic_locator}    _DYNAMIC_${index}    ${value}
    \    ${index}=    Set Variable    ${index+1}
    [Return]    ${dynamic_locator}