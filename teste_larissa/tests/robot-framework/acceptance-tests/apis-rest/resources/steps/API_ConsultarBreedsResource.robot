*** Settings ***
Documentation   Resource para os steps dos testes da API de Breeds
Resource        CommonsResource.robot
Resource        ../variables/Globais.robot
Library         String
Library         JSONLibrary

*** Keywords ***
#--Dado
Dado que existam breeds na base de dados
    Obter breeds

#--Quando
Quando o usuário informar para o campo '${campo}' o valor '${valor}' para consulta
    Atribuir valores para a consulta de breeds    ${campo}=${valor}

Quando o usuário informar os dados para consulta
    Atribuir valores para a consulta de breeds

#--E
E requisitar a consulta
    Requisitar a consulta de breeds

#--Steps
Obter breeds
    ${breeds}    Obter breeds
    Set Test Variable    ${breeds}
    RETURN    "${breeds}"

Atribuir valores para a consulta de breeds 
    [Arguments]    ${limit}=${limit}
    Set Test Variable    ${limit}    

Requisitar a consulta de breeds
    ${response}    GET On Session  ${ALIAS_BREEDS}
         ...    url=${BREEDS_BASE_URL}${ENDPOINT_BREEDS}?limit=${limit}
         ...    expected_status=any
    Set Test Variable    ${response}