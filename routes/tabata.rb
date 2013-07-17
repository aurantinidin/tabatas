class Tabatas < Sinatra::Base
  before '/tabatas*' do
    halt 401, 'Access denied :(' unless params[:key] == ApiKey.first.key
  end

  get '/tabatas' do
    Tabata.all.map { |tabata| "#{tabata.name} (#{tabata.status})" }.join "\n"
  end

  post '/tabatas/add' do
    halt 500 if params[:name].nil?
    tabata = Tabata.new(:name => params[:name],
                        :done => params[:done])
    tabata.save!
    "'#{tabata.name}' saved successfully"
  end

  post '/tabatas/do' do
    message = ''
    if Tabata.where(done: false).count == 0
      message = "All tabatas done! Resetting...\n"
      Tabata.reset_all
    end
    tabata = Tabata.random
    tabata.done = true
    tabata.save!
    message << "Today you're doing #{tabata.name}!"
  end

  post '/tabatas/:id/mark' do
    tabata = Tabata.find(params[:id])
    tabata.done = true
    tabata.save!
    "'#{tabata.name}' marked done"
  end

  post '/tabatas/:id/unmark' do
    tabata = Tabata.find(params[:id])
    tabata.done = false
    tabata.save!
    "'#{tabata.name}' marked not done"
  end

  delete '/tabatas/:id' do
    tabata = Tabata.find params[:id]
    message = "'#{tabata.name}' deleted successfully"
    tabata.delete
    message
  end

end
