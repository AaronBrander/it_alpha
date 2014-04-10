class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	validates :board_id, presence: true
	validates :user_id, presence: true
end
