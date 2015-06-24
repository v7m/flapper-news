class ChangeTitleAndBodyAtPosts < ActiveRecord::Migration
  def up
  	change_column :posts, :title, :string, null: false
  	change_column :posts, :body, :string, null: false
  end
  def down
  	change_column :posts, :body, :string
  	change_column :posts, :title, :string
  end
end
