require 'spec_helper'

describe ApiKey do
  it 'should generate a 32 character key' do
    ApiKey.new.key.length.should eq 32
  end

  it 'should generate unique random keys' do
    ApiKey.new.key.should_not eq ApiKey.new.key
  end
end
