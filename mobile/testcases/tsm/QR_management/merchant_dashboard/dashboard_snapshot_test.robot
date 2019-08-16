*** Settings ***
Documentation       Verify the dashboard snapshot screen display correctly.
Resource            ../../../../resources/init.robot
Resource            ../../../../keywords/tsm/registration_QR/tutorial/tutorial_keywords.robot
Resource            ../../../../keywords/tsm/registration_QR/QR_merchant_status/check_merchant_status_keywords.robot
Resource            ../../../../keywords/tsm/registration_QR/QR_merchant_status/QR_merchant_status_keywords.robot
Resource            ../../../../keywords/tsm/QR_management/merchant_dashboard/dashboard_snapshot_keywords.robot
Test Setup          Open Apps   TSM
Test Teardown       Close Application

*** Variables ***
${thai_id}                  1509901018351
${QR_merchant}              ทดสอบ_ยอดขายรวม
${no_transaction_today}     0.00

*** Keywords ***
Precondition QR Merchant Go To Merchant Dashbord
    Tutorial Page Should Be Opened
    Tap On Check Merchant Status Menu
    Check Merchant Status Page Should Be Opened
    Input Thai ID       ${thai_id}
    Submit Check Merchant Status
    Select On Any Merchants     ${QR_merchant}
    Input OTP Number       ${OTP_NUMBER}
    Submit OTP Number
    QR Merchant Status Page Should Be Opened
    Tap On Merchant Dashboard Bar

*** Test Cases ***
TC_O2O_07970
    [Documentation]      Verify user can direct to Dashboard snapshot screen correctly
    [Tags]      Regression    High    Smoke    Sanity
    Precondition QR Merchant Go To Merchant Dashbord
    Dashboard Snapshot Page Should Be Opened
    Display Dashboard Snapshot Show Correctly
    Total Today Sale Show Correctly     ${no_transaction_today}
    Total Yesterday Sale Show Correctly
    Total Transfer Show Correctly
    Total Subsidy Show Correctly
    Total Reward Show Correctly
    Capture Page Screenshot         filename=TC_O2O_07970_1.png
    Run Keyword If      '${OS}' == 'android'    Swipe Up
    Total TruePoint Show Correctly
    Total Revenue Show Correctly
    Capture Page Screenshot         filename=TC_O2O_07970_2.png