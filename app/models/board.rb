class Board < ActiveRecord::Base
	has_many :ideas, dependent: :destroy
	belongs_to :user #one user created it
	has_many :memberships  #board to user details
	has_many :contributors, through: :memberships, source: :user  #user details

	validates :name, presence: true, length: { maximum: 140}
	validates :user_id, presence: true
	validates :description, presence: true

	VALID_SUBDOMAIN_REGEX = /\A[a-z\d]+(-[a-z\d]+)*\z/i
	validates :subdomain, presence: true, length: { maximum: 20 },
		format: { with: VALID_SUBDOMAIN_REGEX },
		uniqueness: { case_sensitive: false }


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :contact_email, presence: true, format: { with: VALID_EMAIL_REGEX }

	before_save do 
		contact_email.downcase! 
		subdomain.downcase!
	end
end
