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
		@league = League.new(league_params)
		if @league.save
			flash[:success] = "You have just made a new league, add some teams to get started!"
			redirect_to @league
		else
			render 'new'
		end
	end

	private

		def league_params
			params.require(:league).permit(:name, :user_id)
		end
end
