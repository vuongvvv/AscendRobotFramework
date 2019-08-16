*** Settings ***
Resource    ../../../../keywords/common/mobile_common.robot
Resource    ../../../../resources/locators/tsm/registration_privilege/activation_code/activation_code_locators.robot

*** Keywords ***
Allow The iOS Access Permission
    Click On Allow Button    &{activation_screen}[btn_accept_permission]

Allow The Android Access Permission
    # There are 2 access permission popups on Android OS with the same elements
    Click On Allow Button    &{activation_screen}[btn_accept_permission]
    Click On Allow Button    &{activation_screen}[btn_accept_permission]

Enter The Activation Code And Password
    [Arguments]       ${code_ios}      ${code_android}     ${activation_password}
    Run Keyword If      '${OS_NAME}' == 'ios'        Allow The iOS Access Permission
    Wait Until Element Is Visible        &{activation_screen}[txt_activation_code]
    Run Keyword If      '${OS_NAME}' == 'ios'        Input Text      &{activation_screen}[txt_activation_code]      ${code_ios}
    Run Keyword If      '${OS_NAME}' == 'android'    Input Text      &{activation_screen}[txt_activation_code]      ${code_android}
    Input Text      &{activation_screen}[txt_activation_password]       ${activation_password}
    Run Keyword If      '${OS_NAME}' == 'android'    Hide Keyboard
    Input Text      &{activation_screen}[txt_activation_confirm]        ${activation_password}
    Hide The Keyboard
    Wait Until Element Is Visible        &{activation_screen}[btn_confirm_submit]
    Click Element    &{activation_screen}[btn_confirm_submit]
    Run Keyword If      '${OS_NAME}' == 'android'    Allow The Android Access Permission
    Wait Until Element Is Visible        &{activation_screen}[btn_start]
    Click Element    &{activation_screen}[btn_start]
