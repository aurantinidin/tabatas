class CreateTabata < ActiveRecord::Migration
  def change
    create_table :tabata do |t|
      t.string :name
      t.boolean :done
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
