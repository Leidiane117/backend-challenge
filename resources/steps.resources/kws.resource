*** Settings ***
Documentation       Keywords de validação de JWT
Resource            ../main.resource


*** Keywords ***
Validar quantidade claim
  [Arguments]   &{json}
  ${result}   Get Dictionary Keys   ${json}
  ${total}    Get Length         ${result}
  Length Should Be    ${result}    3
  
  
Validar chave
  [Arguments]   &{json}
  ${result}   Get Dictionary Keys   ${json}
  Dictionary Should Contain Key     ${json}   Role
  Dictionary Should Contain Key     ${json}   Seed
  Dictionary Should Contain Key     ${json}   Name

Validar Name sem numeros e 256 caracteres
  [Arguments]   &{json}
  ${value_name} =	Get From Dictionary	  ${json}	 Name
  Should Not Match Regexp       ${value_name}	 \\d
  ${caracteres}   Get Length    ${value_name}
  IF    ${caracteres} > 256
      Fail   Mais de 256 caracteres
  END

Validar Role
  [Arguments]   &{json}
  ${value_role} =	Get From Dictionary	  ${json}	 Role
  IF   '${value_role}' == 'Admin' or '${value_role}' == 'Member' or '${value_role}' =='External'
      Log   Valores Válidos
  ELSE
    Fail    Valores de Role inválidos
  END


Validar Seed
  [Arguments]   &{json}
  ${value_seed} =	Get From Dictionary	  ${json}	 Seed
  FOR    ${counter}    IN RANGE    2      ${value_seed}
         ${is_divisible}    Evaluate    int(${value_seed}) % ${counter} == 0
      IF  ${is_divisible}
          Fail    Sed NÃO É PRIMO
      END
  END

Validar campos vazios dos claims
  [Arguments]   &{json}
  ${value_seed} =	Get From Dictionary	  ${json}	 Seed
  ${value_role} =	Get From Dictionary	  ${json}	 Role
  ${value_name} =	Get From Dictionary	  ${json}	 Name
  Should Not Be Equal    ${value_seed}    ${EMPTY}
  Should Not Be Equal 	 ${value_role}    ${EMPTY}
  Should Not Be Equal 	 ${value_name}    ${EMPTY}

Validar JWT
  [Arguments]    &{json}
  Validar quantidade claim    &{json}
  Validar chave    &{json}
  Validar campos vazios dos claims    &{json}
  Validar Name sem numeros e 256 caracteres    &{json}
  Validar Role    &{json}
  Validar Seed    &{json}