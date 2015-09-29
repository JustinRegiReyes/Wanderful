class AddCityIdToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :city_id, :integer
  end
end
