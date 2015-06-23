class ChangeUpvotesAtPosts < ActiveRecord::Migration
  def up
  	change_column :posts, :upvotes, :integer, default: 0
  end

  def down
  	change_column :posts, :upvotes, :integer
  end
end
