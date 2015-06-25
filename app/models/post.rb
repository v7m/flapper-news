class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  acts_as_voteable

  def as_json(options = {})
    super(options.merge(include: [:user, comments: { include: :user }]))
  end 
end
