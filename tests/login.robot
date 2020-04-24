*** Settings ***
Documentation   Acessar pagamento online

Library         SeleniumLibrary

Resource        resources/keywords.robot

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Setup      Antes do teste

*** Test Cases ***

Login com sucesso
        [tags]          smoke
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9
        Input Text                              ${CAMPO_DATA}                  04051982
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${LISTA_TITULOS}
        Click Element                           ${BTN_LOGOUT}
        
Login com o cpf incorreto
        [tags]          cpf_incorreto
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0
        Input Text                              ${CAMPO_DATA}                  04051982
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${ALERTA_ERRO}
        Element Should Contain                  ${ALERTA_ERRO}                 CPF inválido.
        

Login com a data incorreta
        [tags]          data_incorreta
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9
        Input Text                              ${CAMPO_DATA}                  04051983
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${ALERTA_ERRO}
        Element Should Contain                  ${ALERTA_ERRO}                 Data incorreta
        
Login com o cpf em branco
        [tags]          cpf_branco
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Input Text                              ${CAMPO_CPF}                   ${EMPTY}
        Input Text                              ${CAMPO_DATA}                  04051982
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${VALIDACAO_CAMPO}
        Element Should Contain                  ${VALIDACAO_CAMPO}             Preencha o CPF

Login com a data em branco
        [tags]          data_branco
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9
        Input Text                              ${CAMPO_DATA}                  ${EMPTY}
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${VALIDACAO_CAMPO}
        Element Should Contain                  ${VALIDACAO_CAMPO}             Preencha a data de nascimento

# Login com timeout
#        # [tags]          timeout
        # Go To                                   ${BASE_URL}
        # Title Should Be                         ${TITULO_PAGINA}
        # Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9
        # Input Text                              ${CAMPO_DATA}                  04051982
        # Click Element                           ${BTN_LOGIN}
        # Wait Until Element Is Visible           ${ALERTA_ERRO}
        # Element Should Contain                  ${ALERTA_ERRO}                 Erro ao conectar com banco de dados   



