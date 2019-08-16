*** Settings ***
Resource          ../../resources/import.robot

*** Test Cases ***
TC_O2O_06847
     [Documentation]  Verify Delete Merchant by ID fill in data correct
    [Tags]    Regression      Sanity      High      Hercules
    Given Create New Merchant
    When Call Delete Merchant API    ${new_id}
    Then Http Response Should Be '200'
    And Verify Status Should Be Equal 'DELETE'

TC_O2O_06848
    [Documentation]  Verify Delete Merchant by ID dosen't truly exist data
    [Tags]    Regression      Sanity      Medium      Hercules
    When Call Delete Merchant API    001
    Then Http Response Should Be '400'
    And Response Field 'fieldErrors[0].field' Should Be Equal 'merchant.id.MerchantShouldFound'
    And Response Field 'fieldErrors[0].message' Should Be Equal 'Merchant data not found.'

TC_O2O_06849
     [Documentation]  Verify Delete Merchant by ID don't fill in data
     [Tags]    Regression      Sanity      Medium      Hercules
    When Call Delete Merchant API    ${EMPTY}
    Then Http Response Should Be '405'
    And Response Field 'detail' Should Be Equal 'Request method 'DELETE' not supported'