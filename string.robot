*** Settings ***
Documentation    http://robotframework.org/robotframework/latest/libraries/String.html
Library            String
Library            OperatingSystem

*** Test Cases ***
Exemplo 01: Lidando com linhas de um texto String
    Contando as linhas
    Pegando uma linha específica
    Pegando uma linha específica com a palavra "linha 01"
    Pegando até um marcador


Exemplo 02: Manipulando String
    Substituindo valores no texto
    Quero tudo minúsculo
    Quero tudo maiúsculo


*** Keywords ***
Pegando o arquivo
    ${CONTEUDO_ARQUIVO}        Get File        ./string/my_files/arquivo_texto_linhas.txt
    [Return]        ${CONTEUDO_ARQUIVO}
    
Contando as linhas
    ${STRING}        Pegando o arquivo
    ${LINHAS}        Get Line Count    ${STRING}
    Log              Meu arquivo tem: ${LINHAS} linhas!!
Pegando uma linha específica
    ${STRING}          Pegando o arquivo
    ${LINHA_3}         Get Line     ${STRING}    3
    Log                Conteúdo da linha 03 do arquivo:\n"${LINHA_3}"
    FOR      ${NUMERO_LINHA}    IN RANGE    0    6    
            ${CONTEUDO_LINHA}    Get Line    ${STRING}    ${NUMERO_LINHA}
    Log                Conteúdo da linha ${NUMERO_LINHA} do arquivo:\n"${CONTEUDO_LINHA}"
    END
Pegando uma linha específica com a palavra "${PALAVRA}"
    ${string}        Pegando o arquivo
    ${LINHA}         Get Lines Containing String    ${STRING}    ${PALAVRA}
    Log               Linha com ${PALAVRA}:\n"${LINHA}"
Pegando até um marcador       
    ## Use a variável ${SPACE} para o robot enteder que
    ## você quer considerar espaços em branco
    ${STRING}        Pegando o arquivo
    ${LINHA}        Get Line    ${STRING}        0
    ${COMECO}        Fetch From Left    ${LINHA}    marker=0
    ${FIM}           Fetch From Right    ${LINHA}    linha${SPACE}
    Log          Começo: "${COMECO}"\nFim"${FIM}"\n\nTudo junto: "${COMECO}${FIM}"
Substituindo valores no texto
    ${TEXTO}        Pegando o arquivo
    ${NOVO_TEXTO}    Replace String    string=${TEXTO}    search_for=MInha linha    replace_with=Conteúdo da minha linha
    Log              O velho texto era assim:\n${TEXTO}\nO novo texto ficou assim:\n${NOVO_TEXTO}
    Create File    ./my_files/Meu_novo_arquivo.txt        ${NOVO_TEXTO}
 Quero tudo minúsculo
    ${TEXTO}        Pegando o arquivo
    ${TEXTO}        Convert To Lower Case    ${TEXTO}
    Log        Meu texto todo minúsculo:\n${TEXTO}
Quero tudo maiúsculo
    ${TEXTO}        Pegando o arquivo
    ${TEXTO}        Convert To Upper Case        ${TEXTO}
    Log            Meu texto todo maiúsculo:\n${TEXTO}