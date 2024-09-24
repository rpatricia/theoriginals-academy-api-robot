*** Settings ***
Resource    ../../resource/company.resource
Resource    ../../resource/login.resource

*** Test Cases ***
Atualizar status
  Criar sessão autorizada
  Criar dados da company
  Cadastrar company
  Atualizar status
    # Preenche o campo "Status" com o valor "Aguardando"
Editar cadastro da company
  [Tags]    st01
  Criar sessão autorizada
  Criar dados da company
  Cadastrar company
  Editar cadastro da company
Editar cadastro da company
  [Tags]    st02
  Criar sessão autorizada
  Criar dados da company
  Cadastrar company
  Editar endereço da company