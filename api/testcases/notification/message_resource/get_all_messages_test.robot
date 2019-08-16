*** Settings ***
Documentation    Tests to verify that getAllMessages api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/message_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.message.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${status_regex}    ^(SENDING|CANCELED|REJECTED|REQUESTED|PENDING|COMPLETED)$
${last_modified_date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_00756
    [Documentation]     [notification][getAllMessages] Request with valid type and merchantId returns data match with "notification.message" table
    [Tags]      Regression     High    Smoke    E2E    Sanity
    Get All Messages
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .merchantId
    Response Should Contain All Property Values Are Number    .notificationTypeId
    Response Should Contain All Property Values Are Number    .merchantNotificationTypeId
    Response Should Contain All Property Values Are String    .title
    Response Should Contain All Property Values Are String    .messageBody
    Response Should Contain All Property Values Match Regex    .status    ${status_regex}
    Response Should Contain All Property Values Are String Or Null    .rejectReason
    Response Should Contain All Property Values Are Number    .creditsPerMessage
    Response Should Contain All Property Values Are Number    .numberOfAudiences
    Response Should Contain All Property Values Match Regex    .createdDate    ${last_modified_date_regex}