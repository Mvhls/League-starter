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

	def create
		@user = User.find(params[:user_id])
		@league = @user.leagues.new(league_params)
		if @league.save
			flash[:success] = "Congratulations! You have just made a new league! Add some teams to get started!"
			redirect_to @league
		else
			render 'new'
		end
	end

	private

		def league_params
			params.require(:league).permit(:name)
		end
end
