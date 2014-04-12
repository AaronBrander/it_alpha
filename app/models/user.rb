class User < ActiveRecord::Base
	has_many :ideas #ideas the user created
	has_many :boards  #boards the user created
	has_many :memberships #board to member details
	has_many :joined_boards, through: :memberships, source: :board #The board details
	has_many :relationships  #idea to users details (joined / voted)
	has_many :joined_ideas, through: :relationships, source: :idea  #the idea details

	before_save { email.downcase! }
	before_create :create_remember_token

	validates :first_name, presence: true, length: { maximum: 100 }
	validates :last_name, presence: true, length: { maximum: 100 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	
	validates :password, length: { minimum: 6 }
	has_secure_password

	def join!(board)
		memberships.create!(board_id: board.id)
	end

	def joined?(board)
		memberships.find_by(board_id: board.id)
	end

	def leave!(board)
		memberships.find_by(board_id: board.id).destroy
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end

end
