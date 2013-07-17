class Tabatas < Sinatra::Base
  before '/tabatas*' do
    halt 401, 'Access denied :(' unless params[:key] == ApiKey.first.key
    content_type :json
  end

  get '/tabatas' do
    Tabata.all.to_json
  end

  post '/tabatas/add' do
    halt 500 if params[:name].nil?
    tabata = Tabata.new(:name => params[:name],
                        :done => params[:done] || false)
    tabata.save!
    tabata.to_json
  end

  post '/tabatas/:id/mark' do
    tabata = Tabata.find(params[:id])
    tabata.done = true
    tabata.save!
    tabata.to_json
  end

  post '/tabatas/:id/unmark' do
    tabata = Tabata.find(params[:id])
    tabata.done = false
    tabata.save!
    tabata.to_json
  end

  delete '/tabatas/:id' do
    Tabata.find(params[:id]).delete
  end
end
