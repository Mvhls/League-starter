class LeaguesController < ApplicationController

	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@league = @user.leagues.new
	end
end
