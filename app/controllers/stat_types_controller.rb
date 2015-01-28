class StatTypeController < ApplicationController

	def new
		@league = League.find(params[:league_id])
		@stat_type = @league.stat_types.new
	end

	def show
		@league = League.find(params[:league_id])
	end

end
