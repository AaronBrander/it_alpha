class Board < ActiveRecord::Base
	has_many :ideas, dependent: :destroy
	belongs_to :user #one user created it
	has_many :memberships  #board to user details
	has_many :contributors, through: :memberships, source: :user  #user details
end
