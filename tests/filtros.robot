*** Settings ***
Documentation   Validar filtros títulos

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
        ...     12345678909      04/05/1982
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a tela de listagem de títulos

Filtrar por títulos
        Dado que estou na listagem de títulos
        Quando eu informo o id de um título             3916
        Então vejo na lista apenas os títulos com o id

Filtrar por data de vencimento decrescente
        Dado que estou na listagem de títulos
        Quando eu clico no filtro "Vencimento"
        Então vejo os títulos ordenados de forma "decrescente"

Filtrar por data de vencimento crescente
        Dado que estou na listagem de títulos
        Quando eu clico no filtro "Vencimento"
        Então vejo os títulos ordenados de forma "crescente"

Filtrar por valor decrescente
        Dado que estou na listagem de títulos
        Quando eu clico no filtro "Valor"
        Então vejo os títulos ordenados de forma "decrescente"

Filtrar por valor crescente
        [Template]              Selecionar filtros
        valor           crescente

***Keywords***
Selecionar filtros
        [Arguments]     ${filtro}       ${tipo_ordenacao}

        Dado que estou na listagem de títulos
        Quando eu clico no filtro "${filtro}"
        Então vejo os títulos ordenados de forma "${tipo_ordenacao}"