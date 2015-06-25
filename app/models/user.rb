class User < ActiveRecord::Base
	acts_as_voter
  has_karma :posts, as: :submitter, weight: 1
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
