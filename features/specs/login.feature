#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário
    Posso logar no sistema com meus dados previamente cadastrados

    Contexto: Formulário de login
        Dado que estou na página principal

    @login @logout @smoke
    Cenario: Login do usuario

        Quando faço login com "eu@papito.io" e "secret"
        Então sou autenticado
        E vejo as minhas tarefas

    @login_exp
    Esquema do Cenario: Tentativas de login

        Quando faço login com "<email>" e "<senha>"
        Então devo ver a seguinte mensagem "<alerta>"

        Exemplos:
        | email                    | senha  | alerta                            |
        | eu@papito.io             | 123456 | Incorrect password                |
        | padre_kevedo@nokziste.io | 123456 | User not found                    |
        | eu#papito.io             | 123456 | Please enter your e-mail address. |