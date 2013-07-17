class CreateTabata < ActiveRecord::Migration
  def change
    create_table :tabata do |t|
      t.string :name, null: false
      t.boolean :done, null: false, default: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
