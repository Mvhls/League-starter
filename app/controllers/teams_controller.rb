class TeamsController < ApplicationController
	before_action :correct_user, only: [:destroy]

	def index
		@league = League.find(params[:league_id])
		@teams = @league.teams
	end

	def show
		@team = Team.find(params[:id])
	end

	def new
		@league = League.find(params[:league_id])
		@team = @league.teams.new
	end

	def create
		@league = League.find(params[:league_id])
		@team = @league.teams.new(team_params)
		if @team.save
			flash[:success] = "A new team \"#{@team.name}\" was created"
			redirect_to @league
		else
			render 'new'
		end
	end

	def destroy
		league = League.find(params[:league_id])
		if current_user.id == league.user_id # only league commissioner can delete a team
			Team.find(params[:id]).destroy
			flash[:success] = "Team was deleted"
			redirect_to league_url(league)
		else
			redirect_to root_url
		end
	end

	private

		def team_params
			params.require(:team).permit(:name)
		end

		def correct_user
			user_id = League.find(params[:league_id]).user_id
			@user = User.find(user_id)
			
			redirect_to root_url unless current_user?(@user)
		end
end
