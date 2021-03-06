class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
	belongs_to :league

	validates :team_id, presence: true
	validates :league_id, presence: true
	

	def name
		User.find(self.user_id).name
	end
end
