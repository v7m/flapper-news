class ChangeBodyAtComments < ActiveRecord::Migration
  def up
  	change_column :comments, :body, :string, null: false
  end
  def down
  	change_column :comments, :body, :string
  end
end
