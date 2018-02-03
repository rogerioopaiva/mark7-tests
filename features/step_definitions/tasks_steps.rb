Dado('que acessei o formulário de cadastro de tarefas') do
  @tasks = TasksPage.new
  @tasks.add_new.click
end

Dado('que eu tenho uma tarefa com o titulo {string}') do |titulo|
  @titulo = titulo
  # Conecta no banco e garante que a massa de testes está válida
  client = Mongo::Client.new(@mongo_uri)

  tasks = client[:tasks]
  tasks.delete_many('title' => @titulo)
  client.close
end

Dado('a data de finalização é {string}') do |data|
  @data = data
end

Dado('esta tarefa possui as seguintes tags') do |table|
  @tags = table.hashes
end

Quando('faço o cadastro dessa tarefa') do
  @tasks.form.save(@titulo, @data, @tags)
end

Então('essa tarefa deve ser exibida no topo lista') do
  @tasks.wait_for_list
  res = @tasks.list.first

  expect(res).to have_content @titulo
  expect(res).to have_content @data

  # title = 'Ler um livro de JQUERY'

  # # @tasks.list.each do |t|
  # #   if t.text.include?(title)
  # #     puts t.text
  # #   end
  # # end

  # busca_por_texto = find('table tbody tr', text: title)
  # puts busca_por_texto.text
end

# Delete

# Mark7 => MongoDB

# Endereço: ds125556.mlab.com
# Porta: 25556
# Banco de dados: heroku_n0tfl4d8
# Usuário: heroku_n0tfl4d8
# Senha: csdc2tgea0uhsfb1rjs97t75sd


Dado('que eu seleciono uma tarefa') do
  client = Mongo::Client.new('mongodb://heroku_n0tfl4d8:csdc2tgea0uhsfb1rjs97t75sd@ds125556.mlab.com:25556/heroku_n0tfl4d8')
  users = client[:users]
  tasks = client[:tasks]

  user = users.find('profile.email' => @user[:email]).first

  @nova_tarefa = {
    title: Faker::ChuckNorris.fact,
    dueDate: Time.new.to_date,
    tags: %w[tag1 tag2],
    done: true,
    createdBy: user['_id'],
    createdAt: Time.new.to_date
  }

  tasks.insert_one(@nova_tarefa)

  client.close
end

Quando('eu solicito a exclusão dessa tarefa') do
  @tasks = TasksPage.new
  @tasks.wait_for_list
  @tasks.request_delete(@nova_tarefa[:title])
end

Quando('confirmo a solicitação de exclusão') do
  @tasks.delete_yes.click
end

Então('esta tarefa deve ser removida da lista') do
  @tasks.search(@nova_tarefa[:title])
  expect(@tasks.tasks_view).to have_content 'Hmm... nothing matches your search.'
end

Quando("eu não confirmo a exclusão") do
  @tasks.delete_no.click
end

Então("esta tarefa deve permanecer na lista") do
  @tasks.search(@nova_tarefa[:title])
  expect(@tasks.list.size).to eql 1
end
