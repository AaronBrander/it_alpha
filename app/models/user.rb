class User < ActiveRecord::Base
	has_many :ideas #ideas the user created
	has_many :boards  #boards the user created
	has_many :memberships #board to member details
	has_many :joined_boards, through: :memberships, source: :board #The board details
	has_many :relationships  #idea to users details (joined / voted)
	has_many :joined_ideas, through: :relationships, source: :idea  #the idea details


end
