class Tabata < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.random
    where(done: false).order('RANDOM()').limit(1).first
  end

  def self.reset_all
    Tabata.update_all done: false
  end

end
