class PostInitHooks

  initializer :api_key, ActiveRecord::StatementInvalid do
    ApiKey.new.save! if ApiKey.count == 0
  end

end
