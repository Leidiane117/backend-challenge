*** Settings ***
Documentation       Funcionalidade: JWT Token
Resource            ../main.resource
Test Tags            jwt

*** Test Cases ***
T1:claim a menos
  Validar quantidade claim     Seed= 7841    Name=Toninho Araujo

T2: claim a mais
  Validar quantidade claim    Seed= 7841    Name=Toninho Araujo   Org=BR   User=784

T3: validar chave
  Validar chave    Role=Admin     Seed=7841     Names=Toninho Araujo

T4: validar name com numeros
  Validar Name sem numeros e 256 caracteres     Role=Admin     Seed=7841     Name=Joao

T5: validar role
   validar role    Role=Admininstrador     Seed=7841     Name=Joao
   
T6: validar seed
  Validar Seed      Role=Admininstrador      Seed=50    Name=Joao


CT03: Validar JWT
  [Documentation]  Validar  JWT
  ...  JWT com claim válido
  ...  JWT com Name válido
  ...  JWT com valor do Role válido
  ...  Seed primo
  ...  Valores vazios ou nullos nos claims
  ...  JWT tipo válido




****Comments***
Cenário: JWT com valor do Role inválido
Role  Admin, Member ou Externa


Cenário: Seed não primo
Seed número primo
Seed número par, exceto 2

Cenário: Valores vazios ou nullos nos claims
Name “vazio” ou nullo
Seed “vazio”  ou nullo
Role “vazio”  ou nullo



