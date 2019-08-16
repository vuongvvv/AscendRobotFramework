*** Settings ***
Documentation    Tests to verify that SearchTransaction api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/transaction_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_07805
    [Documentation]    [payment][Search Transaction] Request with "payment.payment.read" scope returns 200
    [Tags]    Regression    High    E2E    Sanity    Smoke
    Get Search Transaction
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    content..action
    Response Should Contain All Property Values Are String    content..amount
    Response Should Contain All Property Values Are String    content..channel
    Response Should Contain All Property Values Match Regex    content..createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    content..currency
    Response Should Contain All Property Values Match Regex    content..lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are String    content..merchantId
    Response Should Contain All Property Values Are String    content..mobile
    Response Should Contain All Property Values Are String    content..name
    Response Should Contain All Property Values Are String    content..outletId
    Response Should Contain All Property Values Are String Or Null    content..paymentId
    Response Should Contain All Property Values Are String    content..paymentMethod
    Response Should Contain All Property Values Are String    content..status
    Response Should Contain All Property Values Are String    content..terminalId
    Response Should Contain All Property Values Are String    content..txRefId