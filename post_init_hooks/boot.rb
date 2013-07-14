class PostInitHooks
  class << self
    attr_reader :initializers
    @@initializers = {}

    def initializer name, expected_errors, &block
      @@initializers[name] = Proc.new do
        begin
          yield
        rescue expected_errors => e
          puts "'#{name}' initializer failed with \"#{e}\""
        end
      end
    end

    def run_all
      @@initializers.each do |name, proc|
        proc.call
      end
    end
  end
end

require_relative './hooks'
