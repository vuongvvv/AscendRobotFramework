*** Settings ***
Documentation    Test to verify that get TrueMoney status succeed and
...              fail correctly depending from users input values.

Resource            ../../../resources/init.robot
Resource            ../../../keywords/rpp_payment/get_truemoney_status_keywords.robot
Resource            ../../../keywords/dataplatform/rpp_keywords.robot
Suite Setup         Create RPP Header
Suite Teardown      Delete All Sessions

*** Test Cases ***
TC_O2O_08034
    [Documentation]   Verify search success when only TrueMoney Charge status is succcess
    [Tags]      Regression     GetTrueMoneyStatus     High       RPPPayment      UnitTest      Smoke       SanityOutOfDate
    Get TrueMoney Status       ${SUCCESS_TX_REF_ID}
    Response Correct Code      ${SUCCESS_CODE}
    Response Should Contain Property With Value    queryStatus        success
    Response Should Contain Property With Value    paymentStatus      succeeded
    Response Should Contain Property With Null Value      refundStatus

TC_O2O_08035
    [Documentation]   Verify search success when TrueMoney Charge status is success and Cancel status is success
    [Tags]      Regression     GetTrueMoneyStatus     High       RPPPayment    UnitTest       Smoke       SanityOutOfDate
    Get TrueMoney Status       ${SUCCESS_CANCEL_TX_REF_ID}
    Response Correct Code      ${SUCCESS_CODE}
    Response Should Contain Property With Value    queryStatus        success
    Response Should Contain Property With Value    paymentStatus      succeeded
    Response Should Contain Property With Value    refundStatus       succeeded

TC_O2O_08036
    [Documentation]   Verify search success when rpp_payment have a transaction but no transaction in TrueMoney
    [Tags]      Regression     GetTrueMoneyStatus     High       RPPPayment     UnitTest      Smoke
    Get TrueMoney Status       ${NO_TRANSACTION_TMN_TX_REF_ID}
    Response Correct Code      ${SUCCESS_CODE}
    Response Should Contain Property With Value    queryStatus      success
    Response Should Contain Property With Value    paymentStatus    invalid_isv_payment_ref
    Response Should Contain Property With Null Value      refundStatus

TC_O2O_08037
    [Documentation]   Verify search not found when no transaction in rpp_payment
    [Tags]      Regression     GetTrueMoneyStatus     High       RPPPayment     UnitTest      Smoke
    Get TrueMoney Status       ${NOT_FOUND_TX_REF_ID}
    Response Correct Code      ${NOT_FOUND_CODE}
    # No response content in this case of Not Found

TC_O2O_08041
    [Documentation]   Verify search success when TrueMoney Charge status is Fail
    [Tags]      Regression     GetTrueMoneyStatus     High       RPPPayment      UnitTest     Smoke        SanityOutOfDate
    Get TrueMoney Status       ${FAILED_TX_REF_ID}
    Response Correct Code      ${SUCCESS_CODE}
    Response Should Contain Property With Value    queryStatus      success
    Response Should Contain Property With Value    paymentStatus    failed
    Response Should Contain Property With Null Value      refundStatus
