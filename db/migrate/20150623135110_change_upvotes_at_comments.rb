class ChangeUpvotesAtComments < ActiveRecord::Migration
  def up
  	change_column :comments, :upvotes, :integer, default: 0
  end

  def down
  	change_column :comments, :upvotes, :integer
  end
end
