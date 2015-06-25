class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  acts_as_voteable

  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
