#language:pt

Funcionalidade: Remover tarefa
    Para que eu apagar uma tarefa desejada
    Sendo um usuário 
    Posso solicitar a exclusão de uma tarefa

    @auth @delete @logout @db
    Cenario: Remover tarefa

        Dado que eu seleciono uma tarefa
        Quando eu solicito a exclusão dessa tarefa
            E confirmo a solicitação de exclusão
        Então devo ver a seguinte mensagem "The task has been deleted."
        E esta tarefa deve ser removida da lista

    @auth @delete @logout @db
    Cenario: Desisti da remoção

        Dado que eu seleciono uma tarefa
        Quando eu solicito a exclusão dessa tarefa
            Mas eu não confirmo a exclusão
        Então esta tarefa deve permanecer na lista


