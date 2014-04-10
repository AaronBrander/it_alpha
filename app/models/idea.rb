class Idea < ActiveRecord::Base
	belongs_to :board
	belongs_to :user
	has_many :relationships #votes and joins
	has_many :joined_users, through: :relationships, source: :user

	def voting_users
		#relationships.where(has_voted: true)
		#http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#sec-scopes_subselects_and_a_lambda
	end
end
