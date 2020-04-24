*** Settings ***
Resource        elements.robot

*** Variables ***
${BASE_URL}             http://novalar.pay.staging.sabium.info/
##http://novalar.pay.staging.sabium.info/
##http://moveisbrasilia.pay.staging.sabium.info/
##http://gazin.pay.staging.sabium.info/

*** Keywords ***

Inicia Sessao
        Open Browser                    ${BASE_URL}       chrome        options=add_experimental_option('excludeSwitches', ['enable-logging'])
        Set Window Size                 1200              800
        Set Selenium Implicit Wait      5

Encerra Sessao
        Close Browser

Antes do teste
        Set Selenium Speed              1.8s

Depois do teste
        Capture Page Screenshot
        Click Element                   ${BTN_LOGOUT}

Login com sucesso
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA}
        Press Keys                              ${CAMPO_CPF}                   1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9
        Input Text                              ${CAMPO_DATA}                  04051982
        Click Element                           ${BTN_LOGIN}
        Wait Until Element Is Visible           ${LISTA_TITULOS}

Dado que possuo o seguinte título
        [Arguments]         ${titulo}

        Set Test Variable         ${titulo}

E estou na listagem de títulos
        Login com sucesso
        Wait Until Element Is Visible           ${ID_TITULO}

Quando eu informo o id de um título
        Input Text                              ${ID_TITULO}          ${titulo}
        Press Keys                              ${BTN_BUSCA}          ENTER

Então vejo na lista apenas os títulos com o id "Título: ${titulo}"
        ${valor_alvo}=           Get Text                ${LISTA_ID}
        Should Be Equal          ${valor_alvo}           Título: ${titulo}

Dado que estou na listagem de títulos
        Login com sucesso

E está selecionada a ordenação "Valor"
        Click Element                   ${LINK_ORDEM}

Quando eu seleciono a ordenação "${filtro}"
        Click Element                   ${LINK_ORDEM}
        Element Should Contain          ${ORDENACAO}            ${filtro}

Então vejo os títulos ordenados de forma "${tipo_ordenacao}"
        Element Should Contain          ${TIPO_ORDEM}           ${tipo_ordenacao}

Quando eu clico duas vezes na ordenação "${filtro}"
        Click Element                   ${LINK_ORDEM}
        Click Element                   ${ORDENACAO}
        Element Should Contain          ${ORDENACAO}            ${filtro}

E seleciono os títulos
        Wait Until Element Is Visible           ${TITULO_SELECAO}
        Click Element                           ${TITULO_SELECAO}

Quando avanço para a próxima etapa
        Wait Until Element Is Enabled           ${BTN_PROSSEGUIR}
        Click Element                           ${BTN_PROSSEGUIR}

Então vejo a opção de impressão de boletos
        Wait Until Element Is Visible           ${CARD_TITULO}

Quando clico na opção Limpar
        Wait Until Element Is Enabled           ${BTN_LIMPAR}
        Click Element                           ${BTN_LIMPAR}

Então vejo a mensagem de confirmação
        Element Should Contain                  ${MSG_CONFIRMACAO}        Que deseja deselecionar todos os títulos?

E clico em Sim
        Wait Until Element Is Visible           ${RESPOSTA_SIM}
        Click Element                           ${RESPOSTA_SIM}
        ${num_selecionados}                     Get WebElement                  ${QTD_SELECIONADOS}
        Should Be Equal                         ${num_selecionados.text}        0

E clico em Não
        Wait Until Element Is Visible           ${RESPOSTA_NAO}
        Click Element                           ${RESPOSTA_NAO}
        ${num_selecionados}                     Get WebElement                  ${QTD_SELECIONADOS}
        Should Be Equal                         ${num_selecionados.text}        1

