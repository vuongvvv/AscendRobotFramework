*** Settings ***
Library    SeleniumLibrary    timeout=10s    implicit_wait=5s
Library    DateTime
Library    Collections
Library    String
Resource    ../../resources/locators/admintools/common/common_locators.robot
Resource    ../../../api/keywords/common/validation_common.robot
Resource    locator_common.robot

*** Variables ***
@{chrome_arguments}    --disable-infobars    --disable-gpu     --no-sandbox

*** Keywords ***
Open Browser To Admin Tools
    Open Browser    ${ADMIN_TOOLS_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Open Browser With Chrome Headless Mode
    [Arguments]      ${page_url}
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${page_url}
    Set Window Size    1920    1080

Clean Environment
    Close All Browsers

Navigate On Right Menu Bar
    [Arguments]    ${menu}    ${sub_menu}
    Wait Until Element Is Visible    ${nav_right_menu}
    ${menu_locator}=    Generate Element From Dynamic Locator    ${mnu_right_menu_bar}    ${menu}
    Wait Until Element Is Visible    ${menu_locator}
    Click Element    ${menu_locator}
    ${sub_menu_locator}=    Generate Element From Dynamic Locator    ${mnu_sub_menu}    ${menu}    ${sub_menu}
    Wait Until Element Is Visible    ${sub_menu_locator}
    Click Element    ${sub_menu_locator}

Click the Hamburger Menu
    Wait Until Element Is Visible    ${hamberger_menu}
    Click element    ${hamberger_menu}

Sort By Column Name
    [Arguments]    ${column_name}
    ${column_locator}=    Generate Element From Dynamic Locator    ${lbl_column_name}    ${column_name}
    Click Element    ${column_locator}

Go To Page Number
    [Arguments]    ${page_number}
    ${locator}=    Generate Element From Dynamic Locator    ${lnk_page_number}    ${page_number}
    Click Element    ${locator}

Text Value Of Locator Should Be
    [Arguments]    ${text_locator}    ${expected_value}    @{text_field}
    ${locator}=    Generate Element From Dynamic Locator    ${text_locator}    @{text_field}
    Wait Until Element Is Visible    ${locator}
    Element Text Should Be    ${locator}    ${expected_value}

Date Value Of Locator Greater Than
    [Arguments]    ${date_locator}    ${expected_date_value}=today    @{text_field}
    ${expected_date_time}=    Run Keyword If    '${expected_date_value}' == 'today'    Get Current Date    result_format=%Y-%m-%d    ELSE    Set Variable    ${expected_date_value}
    ${locator}=    Generate Element From Dynamic Locator    ${date_locator}    @{text_field}
    ${element_date}=    Get Text    ${locator}
    Date Should Be Greater Or Equal    ${element_date}    ${expected_date_time}