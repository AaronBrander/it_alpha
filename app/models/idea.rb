class Idea < ActiveRecord::Base
	belongs_to :board
	belongs_to :user
	has_many :relationships #votes and joins
	has_many :joined_users, through: :relationships, source: :user

	default_scope -> { order('created_at DESC')}

	validates :name, presence: true, length: { maximum: 140 }
	validates :description, presence: true
	validates :user_id, presence: true
	validates :board_id, presence: true


	def voting_users
		#relationships.where(has_voted: true)
		#http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#sec-scopes_subselects_and_a_lambda
	end
end
