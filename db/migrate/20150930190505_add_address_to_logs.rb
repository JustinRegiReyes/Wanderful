class AddAddressToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :address, :string
  end
end
