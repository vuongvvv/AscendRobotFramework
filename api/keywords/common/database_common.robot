*** Settings ***
Library      DatabaseLibrary
Resource    list_common.robot

*** Keywords ***
Connect Database
    [Arguments]    ${database_name}
    Connect to database using custom params    ${SQL_MODULE_NAME}    database='${database_name}', user='${SQL_USERNAME}', password='${SQL_PASSWORD}', host='${SQL_HOST}', port=${SQL_PORT}, charset='utf8mb4'

Get Column Index From Table Description
    [Arguments]    ${table_description}    ${column_name}
    ${column_name_list}=    Get List Items From Tuple By Index    ${table_description}    ${0}
    ${return_index}=    Get Index From List    ${column_name_list}    ${column_name}
    [Return]    ${return_index}

Get Values From Query Response By Index
    [Arguments]    ${db_response}    ${index}
    ${return_list}=    Get List Items From Tuple By Index    ${db_response}    ${index}
    [Return]    ${return_list}