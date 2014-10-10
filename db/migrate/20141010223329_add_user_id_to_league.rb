class AddUserIdToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :user_id, :string
    add_column :leagues, :integer, :string
  end
end
