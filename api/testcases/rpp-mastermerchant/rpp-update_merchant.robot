*** Settings ***
Resource          ../../resources/import.robot

*** Test Cases ***
TC_O2O_06825
    [Documentation]  Verify Update Merchant by ID fill in data correct and data to change
    [Tags]    Regression      Sanity      High      Hercules
    Given Create New Merchant
    And Prepare Json Request    ${update_merchant_api}
    And Update 'id' Is '${new_id}' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '200'
    And Response Field 'id' Should Be Equal '${new_id}'
    And Response Field 'storeNameTh' Should Be Equal 'สโนว์ไวท์'
    And Response Field 'storeNameEn' Should Be Equal 'Snow white'
    And Response Field 'firstName' Should Be Equal 'Walt'
    And Response Field 'lastName' Should Be Equal 'Disney'
    And Response Field 'storeDetail' Should Be Equal 'Cartoon'
    And Response Field 'birthdate' Should Be Equal '1990-06-12'
    And Response Field 'gender' Should Be Equal 'female'
    And Response Field 'tmnStatus' Should Be Equal 'APPROVE'
    And Response Field '"trueyouStatus"' Should Be Equal 'ACTIVE'
    And Response Field 'tmnApproveDate' Should Be Equal '2018-10-26T15:56:16'
    And Response Field 'approveDate' Should Be Equal '2018-10-26T15:56:16'

TC_O2O_06828
    [Documentation]  Verify Update Merchant by gender = "male" parameters fill in data correct data to change
    [Tags]    Regression      High      Hercules
    Given Create New Merchant with gender is female
    And Prepare Json Request    ${update_gender_api}
    And Update 'id' Is '${new_id}' For Request
    And Update 'gender' Is 'male' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '200'
    And Response Field 'gender' Should Be Equal 'male'

TC_O2O_06829
    [Documentation]  Verify Update Merchant by gender = blank ("") parameters fill in data correct data to change
    [Tags]    Regression      High      Hercules
    Given Create New Merchant with gender is female
    And Prepare Json Request    ${update_gender_api}
    And Update 'id' Is '${new_id}' For Request
    And Update 'gender' Is '${EMPTY}' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '200'
    And Response Field 'gender' Should Be Equal 'female'

TC_O2O_06830
    [Documentation]  Verify Update Merchant by gender = blank (null) parameters fill in data correct data to change
    [Tags]    Regression      High      Hercules
    Given Create New Merchant with gender is female
    And Prepare Json Request    ${update_gender_api}
    And Update 'id' Is '${new_id}' For Request
    And Update 'gender' Is '${NULL}' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '200'
    And Response Field 'gender' Should Be Equal 'female'

TC_O2O_06837
    [Documentation]  Verify Update Merchant when fill in Id dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Prepare Json Request    ${update_merchant_api}
    And Update 'id' Is '017' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '400'
    And Response Field 'fieldErrors[0].field' Should Be Equal 'MerchantShouldFound'
    And Response Field 'fieldErrors[0].message' Should Be Equal 'Merchant data not found.'

TC_O2O_06839
    [Documentation]  Verify update Merchant by gender dosen't truly exist data and all fill in data correct
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant with gender is female
    And Prepare Json Request    ${update_gender_api}
    And Update 'id' Is '${new_id}' For Request
    And Update 'gender' Is 'mal' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '400'
    And Response Field 'fieldErrors[0].field' Should Be Equal 'EnumType'
    And Response Field 'fieldErrors[0].message' Should Be Equal 'Gender invalid'

TC_O2O_06845
    [Documentation]  Verify update Merchant by without time "tmnApproveDate" ,"trueyouApproveDate","approveDate" = "2018-10-25" parameters fill in data correct
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Prepare Json Request    ${update_without_time_api}
    And Update 'id' Is '${new_id}' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '400'
    And Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime'

TC_O2O_06846
    [Documentation]  Verify update Merchant by without time "tmnApproveDate" ,"trueyouApproveDate","approveDate" = "01-10-2018T16:37:16" parameters fill in data correct
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Prepare Json Request    ${update_without_time_api}
    And Update 'id' Is '${new_id}' For Request
    And Update 'tmnApproveDate' Is '01-10-2018T16:37:16' For Request
    And Update '"trueyouApproveDate"' Is '01-10-2018T16:37:16' For Request
    And Update 'approveDate' Is '01-10-2018T16:37:16' For Request
    When Call Update Merchant API    ${request}
    Then Http Response Should Be '400'
    And Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime'