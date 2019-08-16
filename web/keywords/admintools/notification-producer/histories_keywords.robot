*** Settings ***
Resource    ../../../resources/locators/admintools/notification-producer/histories_locators.robot

*** Keywords ***
Click View Button On Row
    [Arguments]    ${row_number}
    ${locator}=    Generate Element From Dynamic Locator    ${btn_view_histories_table}    ${row_number}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}