class CreateUserCities < ActiveRecord::Migration
  def change
    create_table :user_cities do |t|

      t.timestamps null: false
    end
  end
end
