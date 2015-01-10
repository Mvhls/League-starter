class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :source_id

      t.timestamps
    end
  end
end
