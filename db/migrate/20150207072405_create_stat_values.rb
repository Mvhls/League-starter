class CreateStatValues < ActiveRecord::Migration
  def change
    create_table :stat_values do |t|
      t.integer :stat_type_id
      t.integer :value

      t.timestamps
    end
  end
end
