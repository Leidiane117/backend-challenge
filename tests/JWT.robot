*** Settings ***
Documentation       Funcionalidade: JWT Token
Resource            ../resources/main.resource
Test Tags            jwt

*** Test Cases ***
CT01: JWT Name com mais de 256 caracteres 
  [Documentation]  Simulação ERRO Name com mais de 256 caracteres 
  Validar JWT           Role=Admin      Seed=5      Name=fjdkalfjdlasjfdalsjfdkaslfjdkaslfjwoeurqoreuofjldfuqpoiweurjflajfoqiuweroepqjfldafjfdlkghdfosdjafljfdsljfutroiewruqutqoiwueroiwueroiuqweoruwoiuerodfsfjaklsdhgjçlflksajwoiuerlkjfsrewqrjlkdjsflkasdjflkasjdflajslfjafjaksrewqoiurweuroqiwuqoueqwdjuwlsowloslwoiow
  
CT02: JWT Role inválido 
  [Documentation]  Simulação ERRO Role inválido
  Validar JWT           Role=Administrador      Seed=5      Name=Leidiane Soares

CT03: JWT Seed não primo
  [Documentation]  Simulação ERRO Role inválido
  Validar JWT       Role=Admin      Seed=4    Name=Leidiane Soares

CT04: JWT claims vazios
  [Documentation]  Simulação ERRO Role inválido
  Validar JWT       Role=    Seed=    Name=

CT05: JWT quantidade de claims a mais
  [Documentation]  Claims a mais
  Validar JWT       Role=Admin      Seed=5      Name=Leidiane Soares    User=Global

CT06: JWT quantidade de claims a menos
  [Documentation]  Claims a menos
  Validar JWT       Role=Admin      Seed=5      

CT07: JWT quantidade de claim inválido
  [Documentation]  Claim inválido
  Validar JWT      Role=Admin      Seed=5    User=Global

CT08: JWT correto
  [Documentation]  Claims no padrão exigido
  Validar JWT       Role=Admin      Seed=5      Name=Leidiane Soares
