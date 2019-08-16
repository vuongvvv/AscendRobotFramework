  #coding: utf-8

*** Settings ***
Resource          ../../resources/import.robot


*** Test Cases ***

############################################   Creation Merchant is successful    ############################################


TC_O2O_06854
   [Documentation]  Verify Create Muti Terminal by parameters fill in data correct
   [Tags]    Regression         Sanity         High         Hercules
###### Create Merchant
       To Create a New Merchant for using in 'create outlet' script
       To Covert a JSON File for using in 'create outlet' script
####### Create Outlet
       To Prepare Outlet Info by creating Global outletID from random number
       To Prepare Outlet Info by creating Global trueyouId from random number
       To Prepare Outlet Info by creating Global tmnOutletId from random number
         ${data}=    To Prepare JSON file for sending request to the system (one oulet)
       To Create multi outlets API With JSON Body  ${MerchantId_forOutlet}   ${data}
       To Get Outlets Info and set it to be Global outlet
####### Create Terminal
       To Prepare Terminal Info by creating Global activateCode from random number
       ${getData}=    To Prepare JSON file for sending request to create multi terminals
       To Create multi terminals API With JSON Body  ${MerchantId_forOutlet}  ${getOutletId}   ${getData}
       To Get activateCode,terminalId and set it to be Global activateCode
       Http Response Should Be '201'
