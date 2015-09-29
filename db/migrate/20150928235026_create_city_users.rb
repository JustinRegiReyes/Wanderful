class CreateCityUsers < ActiveRecord::Migration
  def change
    create_table :city_users do |t|

      t.timestamps null: false
    end
  end
end
