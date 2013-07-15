class Tabatas < Sinatra::Base
  get '/' do
    'web interface here'
  end

  before '/tabatas*' do
    halt 401, 'Access denied :(' unless params[:key] == ApiKey.first.key
  end

  get '/tabatas' do
    content_type :json
    Tabata.all.to_json
  end

  get '/tabatas/add' do

  end

  get '/tabatas/:id/show' do

  end

  get '/tabatas/:id/mark_done' do

  end

  get '/tabatas/:id/mark_ready' do

  end

  get '/tabatas/:id/delete' do

  end
end
