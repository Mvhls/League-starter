class AddGameIdToStatValues < ActiveRecord::Migration
  def change
  	add_column :stat_values, :game_id, :integer
  end
end
