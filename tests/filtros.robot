*** Settings ***
Documentation   Validar filtros pagamento online

Library         SeleniumLibrary

Resource        resources/keywords.robot

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Setup      Antes do teste
Test Teardown   Depois do teste


*** Test Cases ***

Filtrar por títulos
        [tags]          idtitulo
        Dado que possuo o seguinte título       15
        E estou na listagem de títulos
        Quando eu informo o id de um título             
        Então vejo na lista apenas os títulos com o id "Título: 15"

Filtrar por data de vencimento crescente
        [tags]          vencimentoasc
        Dado que estou na listagem de títulos
        E está selecionada a ordenação "Valor"
        Quando eu seleciono a ordenação "Vencimento"
        Então vejo os títulos ordenados de forma "↑"

Filtrar por data de vencimento decrescente
        [tags]          vencimentodesc
        Dado que estou na listagem de títulos
        E está selecionada a ordenação "Valor"
        Quando eu clico duas vezes na ordenação "Vencimento"
        Então vejo os títulos ordenados de forma "↓"

Filtrar por valor crescente
        [tags]          valorasc
        Dado que estou na listagem de títulos
        Quando eu seleciono a ordenação "Valor"
        Então vejo os títulos ordenados de forma "↑"

Filtrar por valor decrescente
        [tags]          valordesc
        Dado que estou na listagem de títulos
        Quando eu clico duas vezes na ordenação "Valor"
        Então vejo os títulos ordenados de forma "↓"
