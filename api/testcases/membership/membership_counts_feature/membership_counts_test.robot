*** Settings ***
Documentation    Tests to verify that the API for count the number of memberships in various conditions is working fine

Resource    ../../../resources/init.robot
Resource    ../../../keywords/membership/membership_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=merchant.merchant.actAsAdmin
Test Teardown    Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
##TEST DATA
${valid_merchant_id}    5b4f06ec30a578000198df80
${invalid_merchant_id}    999999
${invalid_data_format}    abc
${equal_date_format}    2018-05-18T15:11:47Z
${valid_date_format}    2018-05-31T17:00:00Z
${past_date_format}    2008-01-01T00:00:00Z
${future_date_format}    2020-01-01T00:00:00Z
${invalid_date_format}    2018-05-25

##ERROR MESSAGES FOR MEMBER COUNTS API
${title_permission_deny}    Permission Deny
${title_bad_request}    Bad Request
${title_constraint_violation}    Constraint Violation

*** Test Cases ***
TC_O2O_00655
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" only
    [Tags]    Membership    Regression    Smoke    High
    Get Membership Count By Merchant ID    ${valid_merchant_id}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00656
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "userId.in" - Single
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And User ID    ${valid_merchant_id}    8
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00657
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "userId.in" - Multiple
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And User ID    ${valid_merchant_id}    8,71
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00658
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "memberCode.in" - Single
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Member Code    ${valid_merchant_id}    1-mock01
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00659
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "memberCode.in" - Multiple
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Member Code    ${valid_merchant_id}    1-mock01,1-mock02
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00660
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "joinDate.equals"
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Equal Join Date    ${valid_merchant_id}    ${equal_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00661
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "joinDate.greaterOrEqualThan" - Equal
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Greater Or Equal Than Join Date    ${valid_merchant_id}    ${equal_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00662
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "joinDate.greaterOrEqualThan" - Greater than
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Greater Or Equal Than Join Date    ${valid_merchant_id}    ${valid_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00663
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "joinDate.lessOrEqualThan" - Equal
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Less Or Equal Than Join Date    ${valid_merchant_id}    ${equal_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00664
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "joinDate.lessOrEqualThan" - Less than
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Less Or Equal Than Join Date    ${valid_merchant_id}    ${valid_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00665
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "subscribed.equals"
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Subscribed Status    ${valid_merchant_id}    true
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00666
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "membershipId.in" - Single
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Membership ID    ${valid_merchant_id}    1
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00667
    [Documentation]    [Search] Able to get the member counts by using valid "merchantId" and valid "membershipId.in" - Multiple
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Membership ID    ${valid_merchant_id}    1,2
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned Correctly

TC_O2O_00668
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "merchantId" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID    ${invalid_merchant_id}
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    title    ${title_permission_deny}

TC_O2O_00669
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "merchantId" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID    ${invalid_data_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_bad_request}

TC_O2O_00670
    [Documentation]    [Format] Get the member counts as zero if sending an invalid "userId.in" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And User ID    ${valid_merchant_id}    99999
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned As Zero

TC_O2O_00671
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "userId.in" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And User ID    ${valid_merchant_id}    ${invalid_data_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}

TC_O2O_00672
    [Documentation]    [Format] Get the member counts as zero if sending an invalid "memberCode.in" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Member Code    ${valid_merchant_id}    code-inv
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned As Zero

TC_O2O_00673
    [Documentation]    [Format] Get the member counts as zero if sending an invalid "joinDate.equals" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Equal Join Date    ${valid_merchant_id}    ${future_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned As Zero

TC_O2O_00674
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "joinDate.equals" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Equal Join Date    ${valid_merchant_id}    ${invalid_date_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}

TC_O2O_00675
    [Documentation]    [Format] Get the member counts as zero if sending an invalid "joinDate.greaterOrEqualThan" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Greater Or Equal Than Join Date    ${valid_merchant_id}    ${future_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned As Zero

TC_O2O_00676
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "joinDate.greaterOrEqualThan" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Greater Or Equal Than Join Date    ${valid_merchant_id}    ${invalid_date_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}

TC_O2O_00677
    [Documentation]    [Format] Get the member counts as zero if sending an invalid "joinDate.lessOrEqualThan" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Less Or Equal Than Join Date    ${valid_merchant_id}    ${past_date_format}
    Response Correct Code    ${SUCCESS_CODE}
    Member Counts Should Be Returned As Zero

TC_O2O_00678
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "joinDate.lessOrEqualThan" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Less Or Equal Than Join Date    ${valid_merchant_id}    ${invalid_date_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}

TC_O2O_00679
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "subscribed.equal" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Subscribed Status    ${valid_merchant_id}    ${invalid_data_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}

TC_O2O_00680
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "membershipId.in" value
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Membership ID    ${valid_merchant_id}    0
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    title    ${title_permission_deny}

TC_O2O_00681
    [Documentation]    [Format] Unable to get the member counts if sending an invalid "membershipId.in" format
    [Tags]    Membership    Regression    Medium
    Get Membership Count By Merchant ID And Membership ID    ${valid_merchant_id}    ${invalid_data_format}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    ${title_constraint_violation}