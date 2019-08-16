*** Settings ***
Documentation    Tests to verify that getMerchantRemainQuotaByNotificationType api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/merchant_notification_type_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve    AND    Get Merchant Id Test Data
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}

*** Test Cases ***
TC_O2O_00708
    [Documentation]     [API] [SMS] [Get Mechant Remaining Quota Limit] Request with valid typeId and merchantId returns data match with "notification.merchant_notification_type" table
    [Tags]      Regression     High    Smoke    Sanity    E2E
    Get Merchant Remain Quota By Notification Type    ${type_id}    ${TEST_DATA_MERCHANT_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Number String    id
    Response Should Contain Property With Value    typeId    ${type_id}
    Response Should Contain Property With Value    merchantId    ${TEST_DATA_MERCHANT_ID}
    Response Should Contain Property With Number String    quotaRemaining