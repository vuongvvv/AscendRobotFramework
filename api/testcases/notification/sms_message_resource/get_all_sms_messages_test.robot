*** Settings ***
Documentation    Tests to verify that getAllSMSMessages api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/sms_message_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    sms.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}(|\\.\\d{0,3})Z
@{message_status_list}    COMPLETED    SENDING    FAILED
${eleven_numbers_regex}    \\d{11}
@{audience_status_list}    DELIVERED    PENDING    FAILED    EXPIRED
*** Test Cases ***
TC_O2O_07198
    [Documentation]    [Notification][getAllSMSMessages] Request with "sms.read" scope returns 200
    [Tags]    Regression    High    Smoke    UnitTest    E2E    Sanity
    Get All SMS Messages
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    .createdBy
    Response Should Contain Property Matches Regex    .createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .lastModifiedBy
    Response Should Contain Property Matches Regex    .lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .senderName
    Response Should Contain All Property Values Are String    .messageBody
    Response Should Contain All Property Values Are String    .externalTransactionReference
    Response Should Contain All Property Values Are String    .createdByClient
    Response Should Contain All Property Values Are String    .createdByUser
    Response Should Contain All Property Values Are String    .jobId
    Response Should Contain Property Value Include In List    .status    ${message_status_list}
    Response Should Contain All Property Values Are String Or Null    .remark
    Response Should Contain All Property Values Are Number    .creditsPerMessage
    Response Should Contain All Property Values Are Null    .audiences

TC_O2O_07199
    [Documentation]    [Notification][getAllSMSMessages] Request without "sms.read" scope returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get All SMS Messages
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    sms.read
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope

TC_O2O_07200
    [Documentation]    [Notification][getAllSMSMessages] Request with fields=audiences returns 200 with audiences information
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get All SMS Messages    fields=audiences
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    .createdBy
    Response Should Contain Property Matches Regex    .createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .lastModifiedBy
    Response Should Contain Property Matches Regex    .lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .senderName
    Response Should Contain All Property Values Are String    .messageBody
    Response Should Contain All Property Values Are String    .externalTransactionReference
    Response Should Contain All Property Values Are String    .createdByClient
    Response Should Contain All Property Values Are String    .createdByUser
    Response Should Contain All Property Values Are String    .jobId
    Response Should Contain Property Value Include In List    .status    ${message_status_list}
    Response Should Contain All Property Values Are String Or Null    .remark
    Response Should Contain All Property Values Are Number    .creditsPerMessage
    Response Should Contain All Property Values Are String    .audiences..createdBy
    Response Should Contain Property Matches Regex    .audiences..createdDate    ${date_regex}
    Response Should Contain All Property Values Are String    .audiences..lastModifiedBy
    Response Should Contain Property Matches Regex    .audiences..lastModifiedDate    ${date_regex}
    Response Should Contain All Property Values Are Number    .audiences..id
    Response Should Contain Property With List Matches Regex    .audiences..contact    ${eleven_numbers_regex}
    Response Should Contain All Property Values Are String    .audiences..transactionId
    Response Should Contain Property Value Include In List    .audiences..status    ${audience_status_list}
    Response Should Contain All Property Values Are String Or Null    .audiences..remark
    Response Should Contain All Property Values Are Null    .audiences..message