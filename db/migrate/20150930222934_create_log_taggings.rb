class CreateLogTaggings < ActiveRecord::Migration
  def change
    create_table :log_taggings do |t|
      t.belongs_to :log, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
