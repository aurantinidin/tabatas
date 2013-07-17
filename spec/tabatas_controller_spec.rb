require 'spec_helper'

describe 'tabatas' do
  before(:all) do
    @valid_api_key = ApiKey.first.key
  end

  after do
    Tabata.delete_all
  end

  it 'should not load Tabatas without an api key' do
    response = App.get '/tabatas'
    response.code.should eq 401
  end

  it 'should not load Tabatas with an invalid api key' do
    response = App.get '/tabatas?key=fake'
    response.code.should eq 401
  end

  it 'should load Tabatas with a valid api key' do
    response = App.get "/tabatas?key=#{@valid_api_key}"
    response.code.should eq 200
  end

  it 'should add a valid Tabata' do
    response = App.post "/tabatas/add?key=#{@valid_api_key}", body: { name: "Test", done: true }
    response.code.should eq 200
    response.body.should eq "'Test' saved successfully"
  end

  it 'should not add an invalid Tabata' do
    response = App.post "/tabatas/add?key=#{@valid_api_key}", body: { done: false }
    response.code.should eq 500
  end

  context 'with an existing tabata' do
    before do
      @tabata = Tabata.create! name: "Test", done: false
    end

    it 'should mark a Tabata as done' do
      response = App.post("/tabatas/#{@tabata.id}/mark?key=#{@valid_api_key}").body
      response.should eq "'Test' marked done"
    end

    it 'should unmark a Tabata as done' do
      @tabata.done = true
      @tabata.save!
      response = App.post("/tabatas/#{@tabata.id}/unmark?key=#{@valid_api_key}").body
      response.should eq "'Test' marked not done"
    end

    it 'should delete a Tabata' do
      response = App.delete "/tabatas/#{@tabata.id}?key=#{@valid_api_key}"
      response.code.should eq 200
      response.body.should eq "'Test' deleted successfully"
      Tabata.count.should eq 0
    end
  end
end
