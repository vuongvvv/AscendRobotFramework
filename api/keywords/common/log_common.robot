*** Settings ***    
Resource    ../../resources/testdata/component/feature/bugs_data.robot

*** Keywords ***
Log Bug For Test Case
    Run Keyword If Test Failed    Fail    *HTML*<font size="5" color="red"><b>${TEST NAME} failed because of bug: &{bugs_dictionary}[${TEST NAME}]</b></font>         
    Run Keyword If Test Failed    Log    ${TEST NAME} failed because of bug: &{bugs_dictionary}[${TEST NAME}]    ERROR