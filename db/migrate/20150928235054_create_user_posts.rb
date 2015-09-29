class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|

      t.timestamps null: false
    end
  end
end
