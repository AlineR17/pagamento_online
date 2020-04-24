*** Variables ***

${CAMPO_CPF}            id:cpf
${CAMPO_DATA}           id:data
${BTN_LOGIN}            xpath://button[@type='submit']
${TITULO_PAGINA}        Pagamento
${LISTA_TITULOS}        css:h4.titulo-pagina
${ALERTA_ERRO}          css:.snotifyToast__body
${VALIDACAO_CAMPO}      css:.invalid-feedback
${ID_TITULO}            xpath://input[@id="campo-id"]
${LISTA_ID}             xpath://div[@class='id']
${BTN_LOGOUT}           css:#navbar-sair
${BTN_BUSCA}            xpath://button[@id='btn-busca']
${ORDENACAO}            xpath://div[@id='ordenacao']/a[i]
${LINK_ORDEM}           xpath://a[@class='btn btn-sm btn-link']
${TIPO_ORDEM}           xpath://div[@id='ordenacao']/a/i
${TITULO_SELECAO}       css:.custom-control.custom-checkbox
${BTN_PROSSEGUIR}       xpath://button[@class='btn btn-primary btn-lg']
${LISTA_BOLETOS}        xpath://h2[@class='titulo-pagina mt-4']
${CARD_TITULO}          xpath://div[@class='row titulo']
${BTN_LIMPAR}           xpath://button[@class='btn btn-outline-light']
${MSG_CONFIRMACAO}      class:snotifyToast__inner
${RESPOSTA_SIM}         xpath://div[@class='snotifyToast__buttons']/button[1]
${RESPOSTA_NAO}         xpath://div[@class='snotifyToast__buttons']/button[2]
${QTD_SELECIONADOS}     xpath://div[@id='col-selecionados']/h4/span[2]
