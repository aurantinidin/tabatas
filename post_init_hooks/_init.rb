module Initializer
  def safe_initializer name, expected_errors, &block
    begin
      yield
    rescue expected_errors => e
      puts "'#{name}' initializer failed with \"#{e}\""
    end
  end
end
