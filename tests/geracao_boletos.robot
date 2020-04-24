*** Settings ***
Documentation   Gerar boleto no pagamento online

Library         SeleniumLibrary

Resource        resources/keywords.robot

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Setup      Antes do teste
Test Teardown   Depois do teste


*** Test Cases ***
Selecionar títulos para geração de boleto
        [tags]          smoke
        Dado que estou na listagem de títulos
        E seleciono os títulos
        Quando avanço para a próxima etapa
        Então vejo a opção de impressão de boletos

Limpar seleção de títulos
        [tags]          limpar
        Dado que estou na listagem de títulos
        E seleciono os títulos
        Quando clico na opção Limpar
        Então vejo a mensagem de confirmação
        E clico em Sim

Tentar limpar seleção de títulos
        [tags]          nao_limpar
        Dado que estou na listagem de títulos
        E seleciono os títulos
        Quando clico na opção Limpar
        Então vejo a mensagem de confirmação
        E clico em Não