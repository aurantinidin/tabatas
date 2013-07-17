require 'spec_helper'

describe Tabata do
  before do
    @t1 = Tabata.create! name: 'one', done: true
    @t2 = Tabata.create! name: 'two', done: true
    @t3 = Tabata.create! name: 'three', done: true
  end

  after do
    Tabata.delete_all
  end

  it 'should reset all to not done' do
    Tabata.reset_all
    Tabata.where(done: true).count.should eq 0
  end

  it 'should get a random not done tabata' do
    Tabata.update @t1.id, done: false
    Tabata.update @t2.id, done: false
    Tabata.random.should_not eq @t3
  end

end
