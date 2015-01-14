class CreateStatTypes < ActiveRecord::Migration
  def change
    create_table :stat_types do |t|
      t.string :name
      t.integer :league_id
      t.integer :stat_source_id
      t.string :stat_source_type

      t.timestamps
    end

    add_index :stat_types, :stat_source_id
  end
end
