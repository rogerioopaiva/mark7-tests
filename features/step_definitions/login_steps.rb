
Dado('que estou na página principal') do
  @login = LoginPage.new
  @tasks = TasksPage.new
  @login.load
end

Quando('faço login com {string} e {string}') do |email, senha|
  @email = email
  @login.with(email, senha)
end

Então('sou autenticado') do
  expect(@tasks.nav.user_menu).to have_content @email
end

Então('vejo as minhas tarefas') do
  expect(@tasks.page_title.text).to eql 'Tasks'
end

Então('devo ver a seguinte mensagem {string}') do |mensagem|
  expect(@login.toast.message.text).to eql mensagem
end
