*** Settings ***
Documentation    http://robotframework.org/robotframeqork/lateste/libraries/OperatingSystem.html
Library        OperatingSystem

*** Test Cases ***
Exemplo 01: Criando arquivos
    Criando um arquivo de texto
    Criando um arquivo JSON

Exemplo 02: Copiando arquivos
    Copiando meu arquivo
Exemplo 03: lendo arquivos

Exemplo 04: Excluindo arquivos

*** Keywords ***
Criando um arquivo de texto
    Create File    ./my_files/arquivo_TEXTO.txt        Esse curso vai me tornar um ninja em Robot Framework!!!
Criando um arquivo JSON
    Create File     ./my_files/arquivo_JSON                 {"teste01": "valor01", "teste02": 2, "teste03": [1, 2, 3]} 
    
Copiando meu arquivo    
    Copy File    ./my_files/arquivo_TEXTO.txt    ./my_files/arquivo_TEXTO_COPIA.txt
    Copy File    ./my_files/arquivo_JSON.json    ./my_files/aquivo_JSON_copia.json


Lendo conteúdo
    ## O conteúdo é retornado em STRING
    ${MEU_ARQUIVO}         Get File            ./my_files/arquivo_TEXTO.txt
    ${SIZE}                Get File Size      ./my_files/arquivo_TEXTO.txt
Lendo o binário
    ## o binário é retornado
    Should Exist        ./my_files/arquivo_PDF.pdf        msg=O arquivo não existe!! Verifique!
    ${MEU_ARQUIVO}       Get Binary File                  ./my_files/arquivo_PDF.pdf
    ${SIZE}              Get File Size                    ./my_files/arquivo_PDF.pdf
Listando arquivos do meu diretório

Excluir arquivo