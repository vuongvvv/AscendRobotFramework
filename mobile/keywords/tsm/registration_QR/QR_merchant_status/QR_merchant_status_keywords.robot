*** Settings ***
Resource    ../../../../keywords/common/mobile_common.robot
Resource    ../../../../resources/locators/tsm/registration_QR/QR_merchant_status/QR_merchant_status_locators.robot

*** Keywords ***
QR Merchant Status Page Should Be Opened
    Wait Until Element Is Visible        &{QR_merchant_status_android}[menu_total_sale_today_section]

Tap On Merchant Dashboard Bar
    Click Element     &{QR_merchant_status_android}[menu_total_sale_today_section]