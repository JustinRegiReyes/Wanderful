class AddLogIdToCity < ActiveRecord::Migration
  def change
    add_column :cities, :log_id, :integer
  end
end
