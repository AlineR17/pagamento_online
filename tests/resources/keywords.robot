*** Settings ***
Resource        elements.robot

*** Variables ***
${CPF_VALIDO}           123.456.789-09
${DATA_VALIDA}          04/05/1982
${BASE_URL}             http://pagamentonovalar.sabium.info/
##http://pagamentonovalar.sabium.info/
##http://pagamentomoveisbrasilia.sabium.info/
##http://pagamentogazin.sabium.info

*** Keywords ***

Inicia Sessao
        Open Browser                    ${BASE_URL}       chrome
        Set Window Size                 1200              800
        Set Selenium Implicit Wait      5

Encerra Sessao
        Close Browser

Antes do teste
        Set Selenium Speed              1.8s

Depois do teste
        Capture Page Screenshot
        Click Element                           ${BTN_LOGOUT}

Dado que tenho os seguintes dados de acesso
        [Arguments]         ${cpf}      ${data}

        Set Test Variable         ${cpf}     
        Set Test Variable         ${data} 

E acesso o portal de pagamento online
        Go To                                   ${BASE_URL}
        Title Should Be                         ${TITULO_PAGINA} 

Quando eu informo os dados de acesso
        Input Text                              ${CAMPO_CPF}         ${cpf}
        Input Text                              ${CAMPO_DATA}        ${data}

        Click Element                           ${BTN_PROSSEGUIR}

Então vejo a tela de listagem de títulos
        Wait Until Element Is Visible           ${LISTA_TITULOS}

Então vejo a mensagem "${mensagem_esperada}"
        Wait Until Element Is Visible           ${ALERTA_ERRO}
        Element Should Contain                  ${ALERTA_ERRO}      ${mensagem_esperada}

Então vejo a validação "${mensagem_validacao}"
        Element Should Contain                  ${VALIDACAO_CAMPO}      ${mensagem_validacao}

Login com sucesso
        Dado que tenho os seguintes dados de acesso
        ...     ${CPF_VALIDO}      ${DATA_VALIDA}
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a tela de listagem de títulos

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

Quando eu seleciono a ordenação "${filtro}"
        Click Element                   ${LINK_ORDEM}
        Element Should Contain          ${ORDENACAO}            ${filtro}

Então vejo os títulos ordenados de forma "${tipo_ordenacao}"
        Element Should Contain          ${TIPO_ORDEM}           ${tipo_ordenacao}

Quando eu clico duas vezes na ordenação "${filtro}"
        Click Element                   ${LINK_ORDEM}
        Click Element                   ${ORDENACAO}
        Element Should Contain          ${ORDENACAO}            ${filtro}
