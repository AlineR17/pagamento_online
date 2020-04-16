*** Settings ***
Resource        elements.robot

*** Variables ***
${BASE_URL}     http://pagamentonovalar.sabium.info/
##http://pagamentonovalar.sabium.info/
##http://pagamentomoveisbrasilia.sabium.info/
##http://pagamentogazin.sabium.info

*** Keywords ***

Inicia Sessao
        Open Browser                    ${BASE_URL}       chrome
        Set Window Size                 1200              800

Encerra Sessao
        Close Browser

Antes do teste
        Set Selenium Implicit Wait      5
        Set Selenium Speed              1.5s

Depois do teste
        Capture Page Screenshot

Dado que tenho os seguintes dados de acesso
        [Arguments]         ${cpf}      ${data}

        Set Test Variable         ${cpf}     
        Set Test Variable         ${data} 

E acesso o portal de pagamento online
        Go To                                   ${BASE_URL}
        # Title Should Be                         ${TITULO_PAGINA} 

Quando eu informo os dados de acesso
        Input Text                              ${CAMPO_CPF}         ${cpf}     clear=true
        Input Text                              ${CAMPO_DATA}        ${data}    clear=true

        Click Element                           ${BTN_PROSSEGUIR}

Então vejo a tela de listagem de títulos
        Wait Until Element Is Visible           ${LISTA_TITULOS}
        Click Element                           ${BTN_LOGOUT}

Então vejo a mensagem "${mensagem_esperada}"
        Wait Until Element Is Visible           ${ALERTA_ERRO}
        Element Should Contain                  ${ALERTA_ERRO}      ${mensagem_esperada}

Então vejo a validação "${mensagem_validacao}"
        Element Should Contain                  ${VALIDACAO_CAMPO}      ${mensagem_validacao}

Dado que estou na listagem de títulos
        Quando eu informo os dados de acesso

        Wait Until Element Is Visible           ${LISTA_TITULOS}
        Click Element                           ${BTN_LOGOUT}

Quando eu informo o id de um título
        [Arguments]         ${idtitulo}

        Input Text                              ${ID_TITULO}          ${idtitulo}
        Press Keys                              RETURN

Então vejo na lista apenas os títulos com o id
#Título: 3916