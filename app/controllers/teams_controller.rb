class TeamsController < ApplicationController

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

	private

		def team_params
			params.require(:team).permit(:name)
		end
end
