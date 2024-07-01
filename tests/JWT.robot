*** Settings ***
Documentation       Funcionalidade: JWT Token
Resource            ../resources/main.resource
Test Tags            jwt

*** Test Cases ***
CT01: Validar JWT
  [Documentation]  Validar  JWT
  ...  JWT com claim válido
  ...  JWT com Name válido
  ...  JWT com valor do Role válido
  ...  Seed primo
  ...  Valores vazios ou nullos nos claims
  Validar JWT           Role=Admin      Seed=50    Name=Joao

