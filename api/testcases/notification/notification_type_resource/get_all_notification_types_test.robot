*** Settings ***
Documentation    Tests to verify that getAllNotificationTypes api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_01611
    [Documentation]     [notification][getAllNotificationTypes] Verify Get All Notification types api with correct request will return valid response and match with "notification.notification_type" type table
    [Tags]      Regression     High    Smoke    E2E    Sanity
    Get All Notification Types
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .name
    Response Should Contain Property With Number String    .quotaLimit
    Response Should Contain All Property Values Are String Or Null    .rule
    Response Should Contain All Property Values Are String    .terms