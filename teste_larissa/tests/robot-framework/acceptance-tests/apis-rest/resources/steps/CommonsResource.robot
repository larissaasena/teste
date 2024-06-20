*** Settings ***
Documentation   Resource para os steps comuns a todos os testes de API Rest
Resource        ../../../commons-resource/utils/Logger.robot
Resource        ../../../commons-resource/utils/Utilidades.robot
Resource        ../../../commons-resource/utils/BancoDeDados.robot
Library         String
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary

*** Keywords ***
#--Setup
Conectar na API de ${nomeApi}
    [Arguments]   ${url}    ${alias}
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    ${alias}    url=${url}    headers=${headers}
    Set Suite Variable    ${headers}

#-- Teardown
Encerrar Conexões com a API
    Delete All Sessions
    
#-- Então
Então a operação deve ocorrer com sucesso (status_code=${status_code_esperado})
    Conferir status_code da requisição    ${status_code_esperado}    ${response}

Então a operação deve ocorrer sem sucesso (status_code=${status_code_esperado})
    Conferir status_code da requisição    ${status_code_esperado}    ${response}    

#-- E
E deve ser retornada mensagem ${mensagem}
    Set Test Variable    ${mensagem}    For 'limit': Value must be an integer.
    Validar mensagem

E é retornada a lista de breeds do banco de dados
    Retornar lista de breeds cadastrados no banco de dados

#-- Steps
Conferir status_code da requisição
    [Arguments]  ${status_code_esperado}  ${resultado}
    Logar no console e html  ---> Status_code da requisição: ${resultado.status_code}
    Status Should Be  ${status_code_esperado}  ${resultado}
    ...  msg=FALHA: O status_code não é o esperado pelo teste! Verifique!${\n}Status esperado: ${status_code_esperado} <> retornado: ${resultado.status_code}

Validar mensagem
    Should Contain    ${response.json()['detail']}    ${mensagem}

Retornar lista de breeds cadastrados no banco de dados
    #Aqui ficaria a validação conforme as colunas existentes na tabela de Breeds