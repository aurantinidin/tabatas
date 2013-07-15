require 'spec_helper'

describe 'tabatas' do
  it 'should not load Tabatas without an api key' do
    response = App.get '/tabatas'
    response.code.should eq 401
  end

  it 'should not load Tabatas with an invalid api key' do
    response = App.get '/tabatas?key=fake'
    response.code.should eq 401
  end

  it 'should load Tabatas with a valid api key' do
    valid_api_key = ApiKey.first.key
    response = App.get "/tabatas?key=#{valid_api_key}"
    response.code.should eq 200
  end
end
