*** Settings ***
Resource          ../../../resources/locators/admintools/main_page/main_page_locators.robot

*** Keywords ***
Input Username with
    [Arguments]    ${username}
    Input Text    username   ${username}

Input Password with
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit User Credentials
    Click Button    ${login_button}

Login as Estamp Admin
    click button          ${signin_button}
    Input Username with   ${ESTAMP_ADMIN_USER}
    Input Password with   ${ESTAMP_ADMIN_PASSWORD}
    Submit User Credentials

Login Backoffice
    [Arguments]    ${user_name}    ${password}
    click button          ${signin_button}
    Input Username with   ${user_name}
    Input Password with   ${password}
    Submit User Credentials