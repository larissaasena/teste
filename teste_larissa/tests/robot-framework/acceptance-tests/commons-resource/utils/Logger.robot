*** Settings ***
Resource  ../../apis-rest/resources/variables/Globais.robot

*** Keywords ***
Logar no console e html
    [Arguments]       ${MSG}
    Log               ${MSG}    console=${LOG_CONSOLE}