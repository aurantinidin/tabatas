require 'spec_helper'

describe 'tabatas' do
  before(:all) do
    @valid_api_key = ApiKey.first.key
  end

  after do
    Tabata.delete_all
  end

  it 'should not load Tabatas without an api key' do
    response = HTTParty.get 'http://localhost:9292/tabatas'
    response.code.should eq 401
  end

  it 'should not load Tabatas with an invalid api key' do
    response = HTTParty.get 'http://localhost:9292/tabatas?key=fake'
    response.code.should eq 401
  end

  it 'should load Tabatas with a valid api key' do
    response = App.get "/tabatas"
    response.code.should eq 200
  end

  it 'should add a valid Tabata' do
    response = App.post "/tabatas/add", body: { name: "Test", done: true }
    response.code.should eq 200
    response.body.should eq "'Test' saved successfully"
    Tabata.first.name.should eq "Test"
  end

  it 'should not add an invalid Tabata' do
    response = App.post "/tabatas/add", body: { done: false }
    response.code.should eq 500
  end

  it 'should show a message when there are no tabatas' do
    response = App.get "/tabatas"
    response.body.should eq "No tabatas!"
  end

  context 'with an existing tabata' do
    before do
      @tabata = Tabata.create! name: "Test Tabata", done: false
    end

    it 'should mark a Tabata as done' do
      response = App.post("/tabatas/mark", body: { name: @tabata.name }).body
      response.should eq "'Test Tabata' marked done"
    end

    it 'should unmark a Tabata as done' do
      @tabata.done = true
      @tabata.save!
      response = App.post("/tabatas/unmark", body: { name: @tabata.name }).body
      response.should eq "'Test Tabata' marked not done"
    end

    it 'should delete a Tabata' do
      response = App.delete "/tabatas", body: { name: @tabata.name }
      response.body.should eq "'Test Tabata' deleted successfully"
      Tabata.count.should eq 0
    end

    context 'and a couple extra tabatas' do
      before do
        Tabata.create! name: "Test2", done: false
        Tabata.create! name: "Test3", done: true
      end

      it 'should do a tabata' do
        response = App.post "/tabatas/do"
        response.body.should match(/Today you're doing (.* *)+!/)
        Tabata.where(done: true).count.should eq 2
        response = App.post "/tabatas/do"
        Tabata.where(done: true).count.should eq 3
      end

      it 'should list all tabatas' do
        response = App.get "/tabatas"
        response.body.should eq "  Test Tabata\n  Test2\nX Test3"
      end
    end
  end
end
