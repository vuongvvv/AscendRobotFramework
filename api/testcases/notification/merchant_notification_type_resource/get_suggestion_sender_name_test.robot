*** Settings ***
Documentation    Tests to verify that getSuggestionSenderName api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/merchant_notification_type_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.message.approve,notification.registration.approve    AND    Get Merchant Id Test Data
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}

*** Test Cases ***
TC_O2O_02026
    [Documentation]     [notification][getSuggestionSenderName] User with notification.registration.approve or notification.message.approve permission can access getSuggestionSenderName API
    [Tags]      Regression     High    Smoke    Sanity    E2E
    Get Suggestion Sender Name    ${type_id}    ${TEST_DATA_MERCHANT_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With String Or Null    senderName