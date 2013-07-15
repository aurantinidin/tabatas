class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.string :perms
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
