*** Settings ***
Documentation    Tests to verify that Payment query api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/payment_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_true_money_reference_id}    20180420121212336200

*** Test Cases ***
TC_O2O_07803
    [Documentation]    [payment][Payment query] Request with not exist True Money reference id returns 400
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Get Payment Query    ${not_exist_true_money_reference_id}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    data_not_found
    Response Should Contain Property With Value    message    tx_ref_id not found