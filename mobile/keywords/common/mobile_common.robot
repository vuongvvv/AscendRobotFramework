*** Settings ***
Library    String
Library    AppiumLibrary    run_on_failure=Capture Page Screenshot      timeout=10
Library    String
Library    Collections
Library    ../../python_library/common.py
Resource   ../../resources/locators/common/common_locators.robot

*** Keywords ***
Open Apps
    [Arguments]     ${APP_NAME}
    ${app_path_android}=    Get Canonical Path      ${CURDIR}/../../../app-path/Android/tsm.apk
    ${OS}=    Convert To Lowercase        ${OS}
    Run Keyword If      '${OS}' == 'android'
    ...     Open Application    ${REMOTE_URL_ANDROID}
    ...     platformName=&{${DEVICE}}[platformName]
    # ...     platformVersion=&{${DEVICE}}[platformVersion]
    ...     deviceName=&{${DEVICE}}[deviceName]
    ...     app=${app_path_android}
    ...     appPackage=${${APP_NAME}_PACKAGE}
    ...     automationName=uiautomator2
    ...     noReset=False
    Set Suite Variable    ${OS_NAME}    ${OS}

    ##OPEN DEFAULT OR SPECIFIC IOS SIMULATOR
    ${app_path_ios}=    Get Canonical Path      ${CURDIR}/../../../app-path/iOS/tsm.app
    Run Keyword If      '${OS}' == 'ios'
    ...     Open Application    ${REMOTE_URL_IOS}
    ...     platformName=&{${DEVICE}}[platformName]
    ...     platformVersion=&{${DEVICE}}[platformVersion]
    ...     deviceName=&{${DEVICE}}[deviceName]
    ...     app=${app_path_ios}
    ...     waitForAppScript='$.delay(5000); true'
    ...     noReset=False
    Set Suite Variable    ${OS_NAME}    ${OS}

Hide The Keyboard
     Run Keyword If    '${OS}' == 'ANDROID'      Hide Keyboard
     Run Keyword If    '${OS}' == 'IOS'          Hide Keyboard       &{keyboard}[keyboard_done]

Swipe To Left
     ${area}     Get Element Size    &{screen}[screen_size]
     ${start_x}=      Evaluate    0.67 * &{area}[width]
     ${start_y}=      Evaluate    0.90 * &{area}[height]
     ${offset_x}=     Evaluate    0 * &{area}[width]
     ${offset_y}=     Evaluate    0.30 * &{area}[height]
     Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1000

Swipe Up
     ${element_size}=    Get Element Size    &{screen}[screen_size]
     ${element_location}=    Get Element Location    &{screen}[screen_size]
     ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
     ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
     ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
     ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
     Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Select Item On List View
     [Arguments]     ${tbl_list}     ${item}
     @{elements}     Get Webelements    ${tbl_list}
     Click Element    @{elements}[${item}]

Click On Menu
    [Arguments]     ${mnu}
    Click Element       ${mnu}

Click On Back Button
    [Arguments]     ${btn_back}
    Click Element       ${btn_back}

Click On OK Button
    [Arguments]     ${btn_ok}
    Click Element       ${btn_ok}

Alert Popup Is Displayed
    [Arguments]     ${alert}
    Wait Until Element Is Visible       ${alert}        timeout=10s

Click On Allow Button
    [Arguments]     ${btn_allow}
    Wait Until Element Is Visible        ${btn_allow}
    Click Element       ${btn_allow}

Accept Alert Popup
    ${status}   ${value} =      Run Keyword And Ignore Error        Alert Popup Is Displayed    &{alert}[page_alert]
    Run Keyword If      '${status}' == 'PASS'       Click On Allow Button    &{alert}[btn_allow]
    Run Keyword Unless  '${status}' == 'PASS'       Wait Until Page Does Not Contain Element    &{alert}[page_alert]

Switch To Webview Context
    ${default_context}=    Get Current Context
    @{all_context}=    Get Contexts
    ${count_list}=    Get Length    ${all_context}
    ${webview_context}=    Get From List    ${all_context}    ${count_list-1}
    Switch To Context    ${webview_context}

Switch To Native Context
     ${default_context}=    Get Current Context
     @{all_context}=    Get Contexts
     ${count_list}=    Get Length    ${all_context}
     ${native_context}=    Get From List    ${all_context}    0
     Switch To Context    ${native_context}

Page Should Contain Property With Value
    [Arguments]    ${page_content}
    Page Should Contain Text    ${page_content}

Click On Go Button
    [Arguments]     ${btn_go}
    Wait Until Element Is Visible        ${btn_go}
    Click Element       ${btn_go}
