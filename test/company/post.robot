*** Settings ***
Resource    ../../resource/company.resource
Resource    ../../resource/login.resource

*** Test Cases ***
Funcional Cadastrar company

    Criar sessão autorizada
    Criar dados da company
    cadastrar company

Não Funcional cadastrar company sem nome
    [Tags]    01
    Criar sessão autorizada
    Criar dados da company
    Falha cadastro de company sem nome

Não funcional cadastrar company sem email
  Criar sessão autorizada
  
  

