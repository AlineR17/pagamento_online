*** Settings ***
Documentation   Acessar pagamento online

Library         SeleniumLibrary

Resource        resources/keywords.robot

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Setup      Antes do teste
Test Teardown   Depois do teste


*** Test Cases ***

Login com sucesso
        [tags]          smoke
        Dado que tenho os seguintes dados de acesso
        ...     ${CPF_VALIDO}      ${DATA_VALIDA}
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a tela de listagem de títulos

Selecionar títulos para geração de boleto
        Dado que estou na listagem de títulos
        E seleciono os títulos      a
        Quando avanço para a próxima etapa
        Então vejo a opção de impressão de boletos

Limpar seleção de títulos
        Dado que estou na listagem de títulos
        E seleciono os títulos      a
        Quando clico na opção Limpar
        Então vejo a mensagem de confirmação ""
        E clico em Sim

Tentar limpar seleção de títulos
        Dado que estou na listagem de títulos
        E seleciono os títulos      a
        Quando clico na opção Limpar
        Então vejo a mensagem de confirmação ""
        E clico em Não