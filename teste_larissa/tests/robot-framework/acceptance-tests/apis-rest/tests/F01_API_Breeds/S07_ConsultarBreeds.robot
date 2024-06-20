*** Settings ***
Documentation   Suíte de testes para consultar Breeds pela API GET /breeds
Resource        ../../resources/steps/CommonsResource.robot
Resource        ../../resources/steps/API_ConsultarBreedsResource.robot
Suite Setup     Conectar na API de Breeds    ${BREEDS_BASE_URL}    ${ALIAS_BREEDS}
Suite Teardown  Encerrar Conexões com a API

*** Test Cases ***
CT01: Consultar Breeds - Parâmetro Limit igual a zero ([GET] /breeds)
    [Tags]  F01S01CT01
    [Documentation]  XX-XXX
    Dado que existam breeds na base de dados
    Quando o usuário informar os dados para consulta
    E requisitar a consulta
    Então a operação deve ocorrer com sucesso (status_code=200)
    E é retornada a lista de breeds do banco de dados

CT02: Consultar Breeds - Parâmetro Limit igual a float ([GET] /breeds)
    [Tags]  F01S01CT02
    [Documentation]  XX-XXX
    Dado que existam breeds na base de dados
    Quando o usuário informar para o campo 'limit' o valor '0.5' para consulta
    E requisitar a consulta
    Então a operação deve ocorrer sem sucesso (status_code=400)
    E deve ser retornada mensagem 'de erro'