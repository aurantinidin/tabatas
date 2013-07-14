require 'spec_helper'

describe ApiKey do
  it 'should generate a key' do
    ApiKey.new.key.should_not be_nil
  end
end
