*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Resource    ../../apis-rest/resources/variables/Globais.robot

#Nesse arquivo ficariam todas as keywords de Banco de Dados. Alguns exemplos abaixo:
*** Keywords ***
Conectar no Banco de Dados
    #Abre conexão no Banco de Dados.
    Connect To Database

Desconectar do Banco de Dados
    #Encerra a conexão com o Banco de Dados.
    Disconnect From Database