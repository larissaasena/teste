*** Variables ***
## PROJETO DE TESTE
${LOG_CONSOLE}              True
${SCRIPTS_DIR}              ${CURDIR}/../../../commons-resource/scripts/

## API'S
${API_HOST}                 #host
${BREEDS_API_PORT}          #port

${BASE_PATH_API}            /api

${BREEDS_BASE_URL}     http://${API_HOST}:${BREEDS_API_PORT}${BASE_PATH_API}
${ALIAS_BREEDS}        #alias

## ENDPOINTS
${ENDPOINT_BREEDS}      /breeds

## MSG ERRO
${MSG_PADRAO_FALHA_MSG_NAO_ESPERADA}    A mensagem de erro não era a esperada pelo teste! Verifique!