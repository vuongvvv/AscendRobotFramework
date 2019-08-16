  #coding: utf-8

*** Settings ***
Resource          ../../resources/import.robot


*** Test Cases ***

############################################   Creation Merchant is successful    ############################################


TC_O2O_06860
       [Documentation]  Verification update Outlets by sending some parameters
       [Tags]    Regression      Sanity      High      Hercules
###### Create Merchant
       To Create a New Merchant for using in 'create outlet' script
       To Covert a JSON File for using in 'create outlet' script
####### Create Outlet
       To Prepare Outlet Info by creating Global outletID from random number
       To Prepare Outlet Info by creating Global trueyouId from random number
       To Prepare Outlet Info by creating Global tmnOutletId from random number
       ${data}=    To Prepare JSON file for sending request to the system (one oulet)
       To Create multi outlets API With JSON Body  ${MerchantId_forOutlet}   ${data}
####### Update Outlet
       ${updating_data}=    To Prepare JSON file for Updating request data by sending some parameter
       Calling update Outlet    ${MerchantId_forOutlet}   ${updating_data}
       Http Response Should Be '201'

TC_O2O_06861
       [Documentation]  Verification update Outlets by sending whole body
       [Tags]    Regression      Sanity      High      Hercules
###### Create Merchant
       To Create a New Merchant for using in 'create outlet' script
       To Covert a JSON File for using in 'create outlet' script
####### Create Outlet
       To Prepare Outlet Info by creating Global outletID from random number
       To Prepare Outlet Info by creating Global trueyouId from random number
       To Prepare Outlet Info by creating Global tmnOutletId from random number
       ${data}=    To Prepare JSON file for sending request to the system (one oulet)
       To Create multi outlets API With JSON Body  ${MerchantId_forOutlet}   ${data}
####### Update Outlet
       ${updating_data}=    To Prepare JSON file for Updating request data
       Calling update Outlet    ${MerchantId_forOutlet}   ${updating_data}
       Http Response Should Be '201'