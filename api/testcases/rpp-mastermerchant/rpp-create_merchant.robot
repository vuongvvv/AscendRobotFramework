  #coding: utf-8

*** Settings ***
Resource          ../../resources/import.robot



*** Test Cases ***

############################################   Creation Merchant is successful    ############################################

TC_O2O_06604
  [Documentation]  Verify Create Merchant by parameters fill in data correct
  [Tags]    Regression      Sanity      High      Hercules
           Prepare Json Request    ${create_merchant_api}
           Prepare Merchant Info
           Call Create Merchant API With JSON Body and create Global Variable_AU_1001    ${request}
           Http Response Should Be '201'
           Response Field 'id' Should Not Be Empty

TC_O2O_06605
  [Documentation]  Verify Create Merchant by birthdate = '1990-04-18' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Call Create Merchant API With JSON Body and create Global Variable_AU_1002    ${request}
           Http Response Should Be '201'
           Response Field 'id' Should Not Be Empty
           Response Field 'birthdate' Should Be Contain '1990-04-18'

TC_O2O_06606
  [Documentation]  Verify Create Merchant by gender = 'male' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Call Create Merchant API With JSON Body and create Global Variable for preparing use in Get_Benefit_in_Merchant API    ${request}
           Http Response Should Be '201'
           Response Field 'id' Should Not Be Empty
           Response Field 'gender' Should Be Contain 'male'

TC_O2O_06607
  [Documentation]  Verify Create Merchant by gender = 'female' parameters fill in data correct
   [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info
           Update 'gender' Is 'female' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'id' Should Not Be Empty
           Response Field 'gender' Should Be Contain 'female'

TC_O2O_06608
  [Documentation]  Verify Create Merchant by tmnStatus = 'APPROVE' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnStatus}
           Prepare Merchant Info by birthdate
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'id' Should Not Be Empty
           Response Field 'tmnStatus' Should Be Contain 'APPROVE'

TC_O2O_06609
  [Documentation]  Verify Create Merchant by tmnStatus = "" parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnStatus}
           Prepare Merchant Info by birthdate
           Update 'tmnStatus' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'tmnStatus' Should Be Equal '${NULL}'

TC_O2O_06610
  [Documentation]  Verify Create Merchant by tmnStatus = null parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnStatus}
           Prepare Merchant Info by birthdate
           Update 'tmnStatus' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'tmnStatus' Should Be Equal '${NULL}'

TC_O2O_06611
  [Documentation]  Verify Create Merchant by trueyouStatus = 'APPROVE' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouStatus}
           Prepare Merchant Info by birthdate
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouStatus"' Should Be Contain 'APPROVE'

TC_O2O_06612
  [Documentation]  Verify Create Merchant by trueyouStatus = "" parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouStatus}
           Prepare Merchant Info by birthdate
           Update '"trueyouStatus"' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouStatus"' Should Be Equal '${NULL}'

TC_O2O_06613
  [Documentation]  Verify Create Merchant by trueyouStatus = null parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouStatus}
           Prepare Merchant Info by birthdate
           Update '"trueyouStatus"' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouStatus"' Should Be Equal '${NULL}'

TC_O2O_06614
  [Documentation]  Verify Create Merchant by tmnApproveDate = '2018-10-25T16:37:16' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnApproveDate}
           Prepare Merchant Info by tmnApproveDate
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'tmnApproveDate' Should Be Contain '2018-10-25T16:37:16'

TC_O2O_06615
  [Documentation]  Verify Create Merchant by tmnApproveDate = " " parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnApproveDate}
           Prepare Merchant Info by tmnApproveDate
           Update 'tmnApproveDate' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'tmnApproveDate' Should Be Equal '${NULL}'

TC_O2O_06616
  [Documentation]  Verify Create Merchant by tmnApproveDate = null parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_tmnApproveDate}
           Prepare Merchant Info by tmnApproveDate
           Update 'tmnApproveDate' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'tmnApproveDate' Should Be Equal '${NULL}'

TC_O2O_06617
  [Documentation]  Verify Create Merchant by trueyouApproveDate = '2018-10-26T16:37:16' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouApproveDate}
           Prepare Merchant Info by trueyouApproveDate
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouApproveDate"' Should Be Contain '2018-10-25T16:37:16'

TC_O2O_06618
  [Documentation]  Verify Create Merchant by trueyouApproveDate = " " parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouApproveDate}
           Prepare Merchant Info by trueyouApproveDate
           Update '"trueyouApproveDate"' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouApproveDate"' Should Be Equal '${NULL}'

TC_O2O_06619
  [Documentation]  Verify Create Merchant by trueyouApproveDate = null parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouApproveDate}
           Prepare Merchant Info by trueyouApproveDate
           Update '"trueyouApproveDate"' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field '"trueyouApproveDate"' Should Be Equal '${NULL}'

TC_O2O_06620
  [Documentation]  Verify Create Merchant by approveDate = '2018-10-25T16:37:16' parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'approveDate' Should Be Contain '2018-10-25T16:37:16'

TC_O2O_06621
  [Documentation]  Verify Create Merchant by approveDate = " " parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Update 'approveDate' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'approveDate' Should Be Equal '${NULL}'

TC_O2O_06622
  [Documentation]  Verify Create Merchant by approveDate = null parameters fill in data correct
  [Tags]    RegressionExclude      High      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Update 'approveDate' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '201'
           Response Field 'approveDate' Should Be Equal '${NULL}'


##############################################   Creation Merchant is unsuccessful    ############################################


TC_O2O_06625
  [Documentation]  Verify Create Merchant by parameters don't fill in data
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_no_value}
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Verify Response error code for don't fill in data

TC_O2O_06626
  [Documentation]  Verify Create Merchant by merchantId, refId,tmnMerchantId,trueyouId it already exists and all fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api}
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Verify Response error code for data already exists

TC_O2O_06627
  [Documentation]  Verify Create Merchant by birthdate format incorrect and all fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info
           Update 'birthdate' Is '18-04-1990' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Equal 'JSON parse error: format should be yyyy-MM-dd; nested exception is com.fasterxml.jackson.databind.JsonMappingException: format should be yyyy-MM-dd (through reference chain: com.eggdigital.merchant.service.dto.MerchantDTO[\"birthdate\"])'

TC_O2O_06628
  [Documentation]  Verify Create Merchant by gender dosen't truly exist data and all fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Update 'gender' Is 'FEMAL' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'EnumType'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Gender invalid'

TC_O2O_06629
  [Documentation]  Verify Create Merchant by gender = blank ("null") parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Update 'gender' Is 'null' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'EnumType'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Gender invalid'

TC_O2O_06630
  [Documentation]  Verify Create Merchant by gender = blank ("") parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Update 'gender' Is '' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'NotBlank'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Gender is required'

TC_O2O_06631
  [Documentation]  Verify Create Merchant by gender = blank (null) parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Update 'gender' Is '${NULL}' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'NotBlank'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Gender is required'

TC_O2O_06632
  [Documentation]  Verify Create Merchant by code by gender doesn't has parameter and All Parameter fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_birthdate}
           Prepare Merchant Info by birthdate
           Delete 'gender' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'NotBlank'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Gender is required'

TC_O2O_06633
  [Documentation]  Verify Create Merchant by tmnApproveDate = "null" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_tmnApproveDate}
           Prepare Merchant Info by tmnApproveDate
           Update 'tmnApproveDate' Is 'null' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime from String \"null\"'


TC_O2O_06634
  [Documentation]  Verify Create Merchant by trueyouApproveDate = "null" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouApproveDate}
           Prepare Merchant Info by trueyouApproveDate
           Update '"trueyouApproveDate"' Is 'null' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime from String \"null\"'


TC_O2O_06635
  [Documentation]  Verify Create Merchant by approveDate = "null" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Update 'approveDate' Is 'null' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime from String \"null\"'

TC_O2O_06636
  [Documentation]  Verify create Merchant by without time "tmnApproveDate" ,"trueyouApproveDate","approveDate" = "2018-10-25" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Update 'tmnApproveDate' Is '2018-10-25' For Request
           Update '"trueyouApproveDate"' Is '2018-10-25' For Request
           Update 'approveDate' Is '2018-10-25' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime from String \"2018-10-25\"'

TC_O2O_06637
  [Documentation]  Verify create Merchant by without time "tmnApproveDate" ,"trueyouApproveDate","approveDate" = "01-10-2018T16:37:16" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_approveDate}
           Prepare Merchant Info by approveDate
           Update 'tmnApproveDate' Is '01-10-2018T16:37:16' For Request
           Update '"trueyouApproveDate"' Is '01-10-2018T16:37:16' For Request
           Update 'approveDate' Is '01-10-2018T16:37:16' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'detail' Should Be Contain 'JSON parse error: Can not deserialize value of type java.time.LocalDateTime from String \"01-10-2018T16:37:16\"'

TC_O2O_06638
  [Documentation]  Verify Create Merchant by tmnStatus = "null" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_tmnStatus}
           Prepare Merchant Info by birthdate
           Update 'tmnStatus' Is '"${NULL}"' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'EnumType'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Truemoney Status invalid.'


TC_O2O_06639
  [Documentation]  Verify Create Merchant by trueyouStatus = "null" parameters fill in data correct
  [Tags]    RegressionExclude      Medium      Hercules
           Prepare Json Request    ${create_merchant_api_trueyouStatus}
           Prepare Merchant Info by birthdate
           Update '"trueyouStatus"' Is '"${NULL}"' For Request
           Call Create Merchant API With JSON Body    ${request}
           Http Response Should Be '400'
           Response Field 'fieldErrors[0].field' Should Be Equal 'EnumType'
           Response Field 'fieldErrors[0].message' Should Be Equal 'Trueyou Status invalid.'