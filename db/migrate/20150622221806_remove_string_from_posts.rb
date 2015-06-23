class RemoveStringFromPosts < ActiveRecord::Migration
  def up
  	remove_column :posts, :string
  end

  def down
  	add_column :posts, :string
  end
end
