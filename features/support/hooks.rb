
Before do
  page.current_window.resize_to(1280, 800)
end

Before('@db') do
  @mongo_uri = 'mongodb://heroku_n0tfl4d8:csdc2tgea0uhsfb1rjs97t75sd@ds125556.mlab.com:25556/heroku_n0tfl4d8'
end

Before('@auth') do
  @user = { email: 'eu@papito.io', password: 'secret' }

  @login = LoginPage.new
  @login.load
  @login.with(@user[:email], @user[:password])
end

After('@logout') do
  @tasks.nav.sair
end

After do |scenario|
  # tira um print por favor
  file_name = scenario.name.tr(' ', '_').downcase!
  shot = "logs/shots/#{file_name}.png"
  page.save_screenshot(shot)
  embed(shot, 'image/png', 'Clique aqui para ver o print muito chique do teste')
end
