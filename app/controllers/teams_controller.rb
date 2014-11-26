class TeamsController < ApplicationController

	def index
		@league = League.find(params[:league_id])
		@teams = @league.teams
	end

	def show
		@team = Team.find(params[:id])
	end
end
