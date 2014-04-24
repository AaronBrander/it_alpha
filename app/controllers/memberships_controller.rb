class MembershipsController < ApplicationController
	before_action :signed_in_user

	def create
		board = Board.find(params[:id])
		current_user.join!(board)
		respond_to do |format|
			format.html { redirect_to board }
			format.js
		end
	end

	def destroy
		board = Board.find(params[:id])
		current_user.leave!(board)
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js
		end
	end

	
end