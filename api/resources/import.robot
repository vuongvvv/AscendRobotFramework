*** Settings ***
Library    Collections
Library    String
Library    HttpLibrary.HTTP
Library    RequestsLibrary
Library    DatabaseLibrary
Library    JSONLibrary
Library    json
Library    DateTime
Library    OperatingSystem

### KEYWORDS ###
Resource     ../keywords/rpp-mastermerchant/common_keywords.robot
Resource     ../keywords/rpp-mastermerchant/create-merchant-keywords.robot
Resource     ../keywords/rpp-mastermerchant/create-terminals-keywords.robot
Resource     ../keywords/rpp-mastermerchant/create-update-outlets-keywords.robot
Resource     ../keywords/rpp-mastermerchant/delete-merchant-keywords.robot
Resource     ../keywords/rpp-mastermerchant/search-merchant-keywords.robot
Resource     ../keywords/rpp-mastermerchant/update-merchant-keywords.robot

#
#Resource     ../keywords/common/common_keywords.robot
#Resource          testdata/Keywords.txt


### VARIABLES ###
Variables    testdata/rpp-mastermerchant/common_configs.yaml
Resource    testdata/rpp-mastermerchant/create_merchant.txt
Resource    testdata/rpp-mastermerchant/create_outlets.txt
Resource    testdata/rpp-mastermerchant/keywords.txt
Resource    testdata/rpp-mastermerchant/update_merchant.txt

Variables         configs/${ENV}/env_config.yaml