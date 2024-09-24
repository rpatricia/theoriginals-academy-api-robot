*** Settings ***
Resource    ../../resource/company.resource
Resource    ../../resource/login.resource

*** Test Cases ***

Listar company
  Criar sessão autorizada
  Listar company

Consultar company

  Criar sessão autorizada
  Criar dados da company
  Cadastrar company
  Consultar company 
