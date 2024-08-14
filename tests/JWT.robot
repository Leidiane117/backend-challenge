*** Settings ***
Documentation       Funcionalidade: JWT Token
Resource            ../resources/main.resource
Test Tags            jwt

*** Test Cases ***
CT01: Validar JWT
  [Documentation]  Validar  JWT
  Validar JWT           Role=Admin      Seed=5      Name=fjdkalfjdlasjfdalsjfdkaslfjdkaslfjwoeurqoreuofjldfuqpoiweurjflajfoqiuweroepqjfldafjfdlkghdfosdjafljfdsljfutroiewruqutqoiwueroiwueroiuqweoruwoiuerodfsfjaklsdhgjçlflksajwoiuerlkjfsrewqrjlkdjsflkasdjflkasjdflajslfjafjaksrewqoiurweuroqiwuqoueqwdjuwlsowloslwoiow
  
CT02: Validar JWT Role inválido 
  [Documentation]  Simulação ERRO role inválido
  Validar JWT           Role=Administrador      Seed=5      Name=Leidiane Soares
  