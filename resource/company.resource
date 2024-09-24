*** Settings ***
Resource    login.resource

*** Keywords ***
#Post
Criar dados da company
  ${palavra_aleattoria}  Generate Random String  length=20  chars=[LETTERS]
  Set Suite Variable    ${COMPANY_NOME}  C${palavra_aleattoria}
  ${numero_randomico}  Generate Random String  length=14  chars=[NUMBERS]
  Set Suite Variable    ${CNPJ_RAMDOM}    ${numero_randomico}
  Set Suite Variable    ${EMAIL_RAMDOM}    ${palavra_aleattoria}@qacoders.com.br
  Set Suite Variable    ${RAZÃO SOCIAL}  ${company_nome}
  Set Suite Variable    ${CONTATO-RESPONSAVEL}  C${palavra_aleattoria} R${palavra_aleattoria}
  Set Suite Variable    ${NUMERO_TELEFONE}  +(55)${numero_randomico}
  Set Suite Variable    ${DESCRICAO}  ${palavra_aleattoria}
  Set Suite Variable    ${LOGRADOURO}  ${palavra_aleattoria} '
  ${numero}     Generate Random String  length=10  chars=[NUMBERS]
  Set Suite Variable    ${NUMERO_COMPANY}  ${numero}


Cadastrar company
    ${address}  Create Dictionary  zipCode=04777001
     ...  city=São Paulo
     ...  state=SP
     ...  district=Rua das Flores
     ...  street=Avenida Interlagos
     ...  number=50
     ...  complement=de 4503 ao fim - lado ímpar
     ...  country=Brasil
     
     ${listAddress}  Create List    ${address}
     ${body}  Create Dictionary  corporateName=${COMPANY_NOME}
     ...  registerCompany=${CNPJ_RAMDOM}
     ...  mail=${EMAIL_RAMDOM}
     ...  matriz=Testeprimeiro
     ...  responsibleContact=Marcio
     ...  telephone=99999999999999
     ...  serviceDescription=Testes
     ...  address=${listAddress}
     Log  {body}
     ${resposta}    POST On Session    alias=theoriginals    url=/api/company    json=${body}  
     Log    ${resposta.json()}
     Set Suite Variable    ${id_company}       ${resposta.json()["newCompany"]["_id"]}
    

Falha cadastro de company sem nome
    ${address}  Create Dictionary  zipCode=04777001
     ...  city=São Paulo
     ...  state=SP
     ...  district=Rua das Flores
     ...  street=Avenida Interlagos
     ...  number=50
     ...  complement=de 4503 ao fim - lado ímpar
     ...  country=Brasil
     
     ${listAddress}  Create List    ${address}
     ${body}  Create Dictionary  corporateName=
     ...  registerCompany=${CNPJ_RAMDOM}
     ...  mail=${EMAIL_RAMDOM}
     ...  matriz=Testeprimeiro
     ...  responsibleContact=Marcio
     ...  telephone=99999999999999
     ...  serviceDescription=Testes
     ...  address=${listAddress}
     Log  {body}
     ${resposta}    POST On Session    alias=theoriginals    url=/api/company    json=${body}    expected_status=400
     Log    ${resposta.json()}
     Should Be Equal As Strings    O campo 'Nome da empresa' é obrigatório.    ${resposta.json()["error"][0]}
    

#GET
Listar company
  ${resposta}  GET ON Session  alias=theoriginals  url=/api/company
  Log  ${resposta.json()}
Consultar company
  ${resposta}  GET ON Session  alias=theoriginals  url=/api/company/${id_company}
  Log  ${resposta.json()}

#Put     
Atualizar status
  ${body}  Create Dictionary  status=false  
  ${resposta}  PUT On Session  alias=theoriginals  url=/api/company/status/${id_company}  json=${body} 

Editar cadastro da company
  ${body}  Create Dictionary  fullName=Test Test
 ...    mail=test@test.com       
  ${resposta}  PUT On Session  alias=theoriginals  url=/api/company/${id_company}  json=${body}
  Log  ${resposta} 

Editar endereço da company
  ${address}  Create Dictionary  zipCode=04777001
  ...  city=São Paulo
  ...  state=SP
  ...  district=Rua das Flores
  ...  street=Avenida Interlagos
  ...  number=50
  ...  complement=de 4503 ao fim - lado ímpar
  ...  country=Brasil 
  ${listAddress}  Create List  ${address}
  ${body}  Create Dictionary  address=${listAddress}

  ${resposta}  PUT On Session  alias=theoriginals  url=/api/company/address/${id_company}  json=${body}
  Log  ${resposta} 

#DLelete 
Deletar company
  ${resposta}  DELETE On Session  alias=theoriginals  url=/api/company/${id_company}   
  Log  ${resposta.json()}