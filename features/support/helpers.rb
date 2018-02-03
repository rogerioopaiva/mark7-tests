

module Database
  def client
    return Mongo::Client.new('mongodb://heroku_n0tfl4d8:csdc2tgea0uhsfb1rjs97t75sd@ds125556.mlab.com:25556/heroku_n0tfl4d8')
  end

  def remove_by_title(title)
    tasks = client[:tasks]
    tasks.delete_many(title: title)
    client.close
  end
end
