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
        Dado que acesso o portal de pagamento online
        Quando eu informo os dados de acesso
        ...     12345678909      04/05/1982
        Então vejo a tela de listagem de títulos

# Login com o cpf incorreto
#         Dado que acesso o portal de pagamento online
#         Quando eu informo os dados de acesso
#         ...     12345678900      04/05/1982
#         Então vejo a mensagem "CPF inválido."

# Login com a data incorreta
#         Dado que acesso o portal de pagamento online
#         Quando eu informo os dados de acesso
#         ...     12345678909      04/05/1983
#         Então vejo a mensagem "Data incorreta"

# Login com o cpf em branco
#         Dado que acesso o portal de pagamento online
#         Quando eu informo os dados de acesso
#         ...     ${EMPTY}      04/05/1982
#         Então vejo a validação "Preencha o CPF"        

# Login com a data em branco
#         Dado que acesso o portal de pagamento online
#         Quando eu informo os dados de acesso
#         ...     12345678909      ${EMPTY}
#         Então vejo a mensagem "Preencha a data de nascimento"  

# Login com timeout
#         Dado que acesso o portal de pagamento online
#         Quando eu informo os dados de acesso
#         ...     12345678909      04/05/1983
#         Então vejo a mensagem "Erro ao conectar com banco de dados"


