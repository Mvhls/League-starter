class StatTypesController < ApplicationController

	def index
		@league = League.find(params[:league_id])
		@stat_types = @league.stat_types
	end


	def new
		@league = League.find(params[:league_id])
		@stat_type = @league.stat_types.new
	end

	def create
		@league = League.find(params[:league_id])
		@stat_type = @league.stat_types.new(stat_type_params)
		if @stat_type.save
			flash[:success] = "A new stat has been created"
			redirect_to league_stat_types_path(@league)
		else
			render 'new'
		end

	end

	def destroy
		league = League.find(params[:league_id])
		if current_user.id = league.user_id
			StatType.find(params[:id]).destroy
			flash[:success] = "Stat was destroyed"
			redirect_to league_stat_types_path(league)
		else
			redirect_to root_url
		end
	end


private

	def stat_type_params
		params.require(:stat_type).permit(:name)		
	end

end
