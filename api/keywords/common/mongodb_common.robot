*** Settings ***
Library    ../../python_library/common/mongo_manager.py

*** Keywords ***
Connect Mongo Database
    [Arguments]   ${test_db}    ${mongo_username}=${MDB_USER}    ${mongo_password}=${MDB_PASSWORD}    ${mongo_host}=${MDB_HOST}    ${mongo_port}=${MDB_PORT}
    Connect To MongoDB     mongodb://${mongo_username}:${mongo_password}@${mongo_host}/${test_db}    ${mongo_port}