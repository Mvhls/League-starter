class LeaguesController < ApplicationController
	before_action :correct_user, only: [:new, :create, :destroy]

	def index
		@leagues = League.paginate(page: params[:page])
	end

	def show
		@league = League.find(params[:id])
		@user = User.find(@league.user_id)
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

	def destroy
		@user = User.find(params[:user_id]) # for redirecting

    League.find(params[:id]).destroy
    flash[:success] = "League deleted"
    redirect_to user_url(@user)
  end

	private

		def league_params
			params.require(:league).permit(:name)
		end

		def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
