*** Settings ***
Resource    ../../resource/company.resource
Resource    ../../resource/login.resource

*** Test Cases ***

Deletar company
  Criar sessão autorizada
  Criar dados da company
  Cadastrar company
  Deletar company