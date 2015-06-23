class RenameLinkInPosts < ActiveRecord::Migration
  def up
  	rename_column :posts, :link, :body
  end

  def down
  	rename_column :posts, :body, :link
  end
end
