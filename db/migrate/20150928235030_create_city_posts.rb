class CreateCityPosts < ActiveRecord::Migration
  def change
    create_table :city_posts do |t|

      t.timestamps null: false
    end
  end
end
