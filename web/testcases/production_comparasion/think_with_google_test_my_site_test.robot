*** Settings ***
Documentation    Production comparasion using Google test tool
Resource    ../../resources/init.robot
Resource    ../../resources/locators/google/think_with_google_test_my_site_locators.robot
Resource    ../../keywords/common/locator_common.robot

Test Setup    Open Browser With Chrome Headless Mode    https://www.thinkwithgoogle.com/feature/testmysite
Test Teardown    Close browser

*** Test Cases ***
production_comparasion_test
    [Documentation]
    [Tags]    ProductionTest    Sanity
    SeleniumLibrary.Input Text    ${txt_think_with_google_domain_name_to_test}    wemall.com
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_think_with_google_forward}
    SeleniumLibrary.Click Element    ${btn_think_with_google_forward}
    SeleniumLibrary.Wait Until Element Is Visible    ${ddl_think_with_google_country}
    SeleniumLibrary.Select From List By Value    ${ddl_think_with_google_country}    Thailand
    SeleniumLibrary.Select From List By Value    ${ddl_think_with_google_connection}    4G
    SeleniumLibrary.Click Element    ${btn_think_with_google_go}
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_think_with_google_generate_report}    60
    SeleniumLibrary.Input Text    ${txt_think_with_google_compatative}    lazada.co.th
    SeleniumLibrary.Press Key    ${txt_think_with_google_compatative}    \\13
    ${wait_element}=    locator_common.Generate Element From Dynamic Locator    ${lbl_think_with_google_domain_on_rank_table}    lazada.co.th
    SeleniumLibrary.Wait Until Element Is Visible    ${wait_element}
    SeleniumLibrary.Input Text    ${txt_think_with_google_compatative}    shopee.co.th
    SeleniumLibrary.Press Key    ${txt_think_with_google_compatative}    \\13
    ${wait_element}=    locator_common.Generate Element From Dynamic Locator    ${lbl_think_with_google_domain_on_rank_table}    shopee.co.th
    SeleniumLibrary.Wait Until Element Is Visible    ${wait_element}
    SeleniumLibrary.Input Text    ${txt_think_with_google_compatative}    amazon.com
    SeleniumLibrary.Press Key    ${txt_think_with_google_compatative}    \\13
    ${wait_element}=    locator_common.Generate Element From Dynamic Locator    ${lbl_think_with_google_domain_on_rank_table}    amazon.com
    SeleniumLibrary.Wait Until Element Is Visible    ${wait_element}
    SeleniumLibrary.Input Text    ${txt_think_with_google_compatative}    portal.weloveshopping.com
    SeleniumLibrary.Press Key    ${txt_think_with_google_compatative}    \\13
    ${wait_element}=    locator_common.Generate Element From Dynamic Locator    ${lbl_think_with_google_domain_on_rank_table}    portal.weloveshopping.com
    SeleniumLibrary.Wait Until Element Is Visible    ${wait_element}
    SeleniumLibrary.Click Element    ${btn_think_with_google_generate_report}
    SeleniumLibrary.Input Text    ${txt_think_with_google_email}    vuongvvv@gmail.com
    SeleniumLibrary.Click Element    ${btn_think_with_google_send}
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_think_with_google_continue}
    SeleniumLibrary.Click Element    ${btn_think_with_google_continue}