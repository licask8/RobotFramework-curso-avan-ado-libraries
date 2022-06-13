*** Settings ***
Documentation    http://robotframeqork.org/robotframework/latest/libraries/Process.html
Library        Process

*** Test Cases ***

Exemplo 01: Abrindo programas
    Abra e feche o Notepad

Exemplo 02: Executando e aguardando scropts/programas
    Execute um script e aguarde ele finalizar com sucesso
    Execute um script e aguarde ele finalizar com falha 
Exemplo 03: Execute comandos de prompt
    Executando comando diversos de prompt
*** Keywords ***
Abra e feche o Notepad
    ## Inicia o processo e não espera ppor resposta dele
    ## Lembrete: Para caminhos no windos use barras duplas
    ${MEU_PROCESSO}        Start Process    C:\\WINDOWS\\system32\\notepad.exe
    Sleep            3s
    Terminate Process        ${MEU_PROCESSO}        kill=true

Verifica sucesso na execução do processo
    [Arguments]    ${PROCESSO}
    ## RC igual a zero indica sucesso na execução do processo
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${PROCESSO.rc}        0
    ...    msg=ATENÇÃO! o seu processo não executou com sucesso
    ## Se ocorreu erro, vamos logar ele
    Run Keyword If    ${PROCESSO.rc}!=0    Log    FALHA OCORRIDA: "${PROCESSO.stderr}"
Execute um script e aguarde ele finalizar com sucesso
    ## inicia o processo e espera pelo seu término
    ${MEU_PROCESSO}    Run Process    python    hello_word.py
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Verifica sucesso na execução do processo    ${MEU_PROCESSO}
    
Execute um script e aguarde ele finalizar com falha
    ## Inicia o processo e espera pelo seu término
    ${MEU_PROCESSO}     Run Process     python   hello_world_fail.py
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc}
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Log    Falha da execução: ${MEU_PROCESSO.stderr}
    Verifica sucesso na execução do processo      ${MEU_PROCESSO}
Executando comando diversos de prompt
    ## Use o atributo shell=True para habilitar funções de shell,
    ## como criar um diretório, por exemplo
    Run Process    mkdir robot_teste    cwd=${CUDIR}    shell=True