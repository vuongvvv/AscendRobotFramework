*** Settings ***
Documentation    Tests to verify that Request OTP of truemoney wallet api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/wallet_otp_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.write
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${phone_number_not_register_tmn}    0996195054
${incorrect_format_phone_number}    851646625

*** Test Cases ***
TC_O2O_04626
    [Documentation]    [Payment][Verify OTP of truemoney wallet] Verify request OTP (wallet) by format phone number start with 0xxxx (phone number dosen't truly exist in the system in TMN Wallet)
    [Tags]    Regression    High    E2E
    Post Request Otp Of Truemoney Wallet    { "mobile": "${phone_number_not_register_tmn}" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    invalid_account
    Response Should Contain Property With Value    message    Tmn account does not exist.

TC_O2O_04622
    [Documentation]    Verify request OTP (wallet) by phone number is wrong format of phone number
    [Tags]    Regression    High
    Post Request Otp Of Truemoney Wallet    { "mobile": "${incorrect_format_phone_number}" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    invalid_mobile
    Response Should Contain Property With Value    message    The requested mobile number is invalid.

TC_O2O_04623
    [Documentation]    Verify request OTP (wallet) by phone number is null
    [Tags]    Regression    High    Sanity    Smoke
    Post Request Otp Of Truemoney Wallet    { "mobile": null }
    Response Correct Code    ${BAD_REQUEST_CODE}
	Response Should Contain Property With Value    type    https://gateway.weomni.com/constraint-violation
	Response Should Contain Property With Value    title    Method argument not valid
	Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value    path    /api/wallet/otp
	Response Should Contain Property With Value    message    error.validation
	Response Should Contain Property With Value    fieldErrors..objectName    optRequest
	Response Should Contain Property With Value    fieldErrors..field    mobile
	Response Should Contain Property With Value    fieldErrors..message    mobile is required