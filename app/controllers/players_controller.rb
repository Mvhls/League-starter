class PlayersController < ApplicationController
	def create
		@team = Team.find(params[:team_id])
		@league = League.find(@team.league_id)

		if existing_player?
			redirect_to @team
			flash[:notice] = "You are already on this team"
		else
			Player.create(team_id: @team.id, league_id: @league.id, user_id: current_user.id) # current_user from sessions helper
			redirect_to @team
			flash[:success] = "You are now part of the #{@team.name}!"
		end
	end

	private

		def existing_player?
			@team.players.find_by(user_id: current_user.id) != nil
		end

end
