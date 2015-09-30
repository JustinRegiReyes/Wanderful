class AddUserIdToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :user_id, :integer
  end
end
