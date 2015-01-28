class CreateStatTypes < ActiveRecord::Migration
  def change
    create_table :stat_types do |t|
      t.string :name
      t.integer :league_id
      t.string :stat_source

      t.timestamps
    end
  end
end
