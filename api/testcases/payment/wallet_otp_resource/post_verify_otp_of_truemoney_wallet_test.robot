*** Settings ***
Documentation    Tests to verify that Verify OTP of truemoney wallet api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/wallet_otp_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.write
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${phone_number_not_register_tmn}    0996195054

*** Test Cases ***
TC_O2O_04633
    [Documentation]    [Payment][Verify OTP of truemoney wallet] Verify request OTP (wallet) by format phone number start with 0xxxx (phone number dosen't truly exist in the system in TMN Wallet)
    [Tags]    Regression    High    E2E    SanityIgnore    Smoke
    Post Verify Otp Of Truemoney Wallet    { "otpCode": "540627", "otpRef": "TJFN", "authCode": "5020150e4f8594af19b61386aade8846", "mobile": "${phone_number_not_register_tmn}" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    invalid_account
    Response Should Contain Property With Value    message    Tmn account does not exist.

TC_O2O_04632
    [Documentation]    Verify OTP (wallet) by sending request without phone number
    [Tags]    Regression    High    E2E    Sanity    Smoke
    Post Verify Otp Of Truemoney Wallet    { "otpCode": "540627", "otpRef": "TJFN", "authCode": "5020150e4f8594af19b61386aade8846", "mobile": "" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    type    https://gateway.weomni.com/constraint-violation
	Response Should Contain Property With Value    title    Method argument not valid
	Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
	Response Should Contain Property With Value    path    /api/wallet/otp/verify
	Response Should Contain Property With Value    message    error.validation
	Response Should Contain Property With Value    .fieldErrors..objectName    otpVerifyRequest
	Response Should Contain Property With Value    .fieldErrors..field    mobile
	Response Should Contain Property With Value    .fieldErrors..message    mobile is required