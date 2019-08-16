*** Settings ***
Documentation    Tests to verify that getAllSMSAudiences api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/sms_audience_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    sms.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}(|\\.\\d{0,3})Z
@{message_status_list}    COMPLETED    SENDING    FAILED
${eleven_numbers_regex}    \\d{11}
@{audience_status_list}    DELIVERED    PENDING    FAILED    EXPIRED
*** Test Cases ***
TC_O2O_07250
    [Documentation]    [Notification][getAllSMSAudiences] Request with "sms.read" scope returns 200
    [Tags]    Regression    High    Smoke    UnitTest    E2E    Sanity
    Get All SMS Audiences
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    .createdBy
    Response Should Contain Property Matches Regex    .createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .lastModifiedBy
    Response Should Contain Property Matches Regex    .lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain Property With List Matches Regex    .contact    ${eleven_numbers_regex}
    Response Should Contain All Property Values Are String    .transactionId
    Response Should Contain Property Value Include In List    .status    ${audience_status_list}
    Response Should Contain All Property Values Are String Or Null    .remark
    Response Should Contain All Property Values Are Null    .message

TC_O2O_07251
    [Documentation]    [Notification][getAllSMSAudiences] Request without "sms.read" scope returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get All SMS Audiences
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    sms.read
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope

TC_O2O_07252
    [Documentation]    [Notification][getAllSMSAudiences] Request with fields=message returns 200 with message information
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get All SMS Audiences    fields=message
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    .createdBy
    Response Should Contain Property Matches Regex    .createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .lastModifiedBy
    Response Should Contain Property Matches Regex    .lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain Property With List Matches Regex    .contact    ${eleven_numbers_regex}
    Response Should Contain All Property Values Are String    .transactionId
    Response Should Contain Property Value Include In List    .status    ${audience_status_list}
    Response Should Contain All Property Values Are String Or Null    .remark
    Response Should Contain All Property Values Are String    .message..createdBy
    Response Should Contain Property Matches Regex    .message..createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .message..lastModifiedBy
    Response Should Contain Property Matches Regex    .message..lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .message..id
    Response Should Contain All Property Values Are String    .message..senderName
    Response Should Contain All Property Values Are String    .message..messageBody
    Response Should Contain All Property Values Are String    .message..externalTransactionReference
    Response Should Contain All Property Values Are String    .message..createdByClient
    Response Should Contain All Property Values Are String    .message..createdByUser
    Response Should Contain All Property Values Are String    .message..jobId
    Response Should Contain Property Value Include In List    .message..status    ${message_status_list}
    Response Should Contain All Property Values Are String Or Null    .message..remark
    Response Should Contain All Property Values Are Number    .message..creditsPerMessage
    Response Should Contain All Property Values Are Null    .message..audiences