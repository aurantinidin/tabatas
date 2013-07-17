class ApiKey < ActiveRecord::Base
  after_initialize :init

  def init
    self.key ||= generate_key
    self.perms ||= :all
  end

  private

  def generate_key
    SecureRandom.urlsafe_base64 24
  end
end
