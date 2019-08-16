*** Settings ***
Resource    ../../resources/import.robot

*** Keywords ***

To Prepare JSON file for sending request to create multi terminals
  Log        ${terminalsActivatecodeByRandom}
  Log        ${getOutletId}

    &{create_newTerminal}   create dictionary
    ...   terminalDetail=test create terminal_1
    ...   activateCode=${terminalsActivatecodeByRandom}
    ...   device=EDC
    ...   status=APPROVE

    @{terminal_list_1}   create list   ${create_newTerminal}

    &{terminals}   create dictionary
    ...     terminals=${terminal_list_1}

    Return From Keyword    ${terminals}

To Prepare Terminal Info by creating Global activateCode from random number
    Get Rand Numbers Only    11
    Set Global Variable  ${terminalsActivatecodeByRandom}   ${rand_num}

To Create multi terminals API With JSON Body
    [Arguments]    ${merchantId}  ${OutletId}   ${jsonbody}
    Create Session    post_create_terminals    ${url}    disable_warnings=${1}
    &{headers}   set header
    ${RESP}=    Post Request    post_create_terminals    /api/merchants/${merchantId}/outlets/${OutletId}/terminals    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 201    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable       ${response}    ${RESP}


To Get activateCode,terminalId and set it to be Global activateCode

    ${convert}=  Converting a JSON File       ${response.text}
    Log    ${convert}
    Set Global Variable          ${getActivateCode}               ${convert['terminals'][0]['activateCode']}
    Set Global Variable          ${getTerminalId}               ${convert['terminals'][0]['terminalId']}

