*** Settings ***
Resource          ../../../resources/locators/admintools/main_page/main_page_locators.robot

*** Keywords ***
Go to Estamp Main Page
    set browser implicit wait  1 second
    Click the Hamburger Menu
    wait until page does not contain  ${hidden_side_bar}
    click element  ${estamp_menu}
    click element  ${estamp_campaign_menu}
    set browser implicit wait  0 second

Estamp Menu should be displayed
    Element Should Be Visible            ${estamp_menu}