#language: pt

Funcionalidade: Cadastrar tarefas
    Para que eu possa ter o controle das minhas atividades
    Sendo um usuário autenticado
    Posso cadastrar tarefas

    Contexto: Formulário de cadastro de tarefas
        Dado que acessei o formulário de cadastro de tarefas

    @auth @logout @smoke @db
    Cenario: Nova tarefa

        E que eu tenho uma tarefa com o titulo "Fazer compras no Super Mercado"
        E a data de finalização é "2018/01/31"
        E esta tarefa possui as seguintes tags
            |tag    |
            |compras|
            |mercado|
            |cerveja|
        Quando faço o cadastro dessa tarefa
        Então devo ver a seguinte mensagem "The task has been added."
        E essa tarefa deve ser exibida no topo lista


