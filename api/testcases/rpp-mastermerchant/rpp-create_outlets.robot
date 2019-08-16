  #coding: utf-8

*** Settings ***
Resource          ../../resources/import.robot


*** Test Cases ***

############################################   Creation Merchant is successful    ############################################


TC_O2O_06850
       [Documentation]  Verify Create Multi Outlets by parameters fill in data correct
       [Tags]    Regression        Sanity        High        Hercules
###### Create Merchant
       To Create a New Merchant for using in 'create outlet' script
       To Covert a JSON File for using in 'create outlet' script
####### Create Outlet
       To Prepare Outlet Info by creating Global outletID from random number
       To Prepare Outlet Info by creating Global trueyouId from random number
       To Prepare Outlet Info by creating Global tmnOutletId from random number
         ${data}=    To Prepare JSON file for sending request to the system (multi oulet)
       To Create multi outlets API With JSON Body  ${MerchantId_forOutlet}   ${data}
       To Get Outlets Info and set it to be Global outlet
       Http Response Should Be '201'


