*** Settings ***
Documentation
Library    RequestsLibrary
Library    String 
Library    Collections
Library    Telnet


*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=theoriginals    url=https://the-originals.qacoders.dev.br    headers=${headers}  
     

Login com usuário sysadmin
    ${body}    Create Dictionary    mail=sysadmin@qacoders.com    password=1234@Test
    Log  ${body}
    Criar sessão
    ${resposta}    POST On Session    alias=theoriginals    url=/api/login    json=${body}
    Set Test Variable    ${TOKEN}    ${resposta.json()["token"]}

Criar sessão autorizada
    Criar sessão
    Login com usuário sysadmin
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN}        
    Create Session    alias=theoriginals    url=https://the-originals.qacoders.dev.br    headers=${headers} 
   