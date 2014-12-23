class AddLeagueIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :league_id, :integer
  end
end
