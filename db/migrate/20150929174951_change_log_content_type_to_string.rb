class ChangeLogContentTypeToString < ActiveRecord::Migration
  def change
  	change_column :logs, :content, :text
  end
end
