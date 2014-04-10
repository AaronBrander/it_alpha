class User < ActiveRecord::Base
	has_many :ideas
	has_many :boards  #boards the user created
	has_many :memberships #board to member details
	has_many :joined_boards, through: :memberships, source: :board #The board details


end
