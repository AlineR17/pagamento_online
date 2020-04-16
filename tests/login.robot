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
        ...     12345678909      04/05/1982
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a tela de listagem de títulos

Login com o cpf incorreto
        [Template]      Tentar fazer login   
        12345678900      04/05/1982     CPF inválido.

Login com a data incorreta
        [Template]      Tentar fazer login   
        12345678909      04/05/1983     Data incorreta
        
Login com o cpf em branco
        [Template]      Tentar fazer login em branco   
        ${EMPTY}      04/05/1982     Preencha o CPF

Login com a data em branco
        [tags]          bug
        [Template]      Tentar fazer login em branco   
        12345678909      ${EMPTY}     Preencha a data de nascimento

# Login com timeout
#         [Template]      Tentar fazer login   
#         12345678909      04/05/1982     Erro ao conectar com banco de dados

***Keywords***
Tentar fazer login
        [Arguments]     ${cpf}          ${dt_nasc}      ${texto}

        Dado que tenho os seguintes dados de acesso
        ...     ${cpf}      ${dt_nasc}
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a mensagem "${texto}"

***Keywords***
Tentar fazer login em branco
        [Arguments]     ${cpf}          ${dt_nasc}      ${texto}

        Dado que tenho os seguintes dados de acesso
        ...     ${cpf}      ${dt_nasc}
        E acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        Então vejo a validação "${texto}"


