class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :team

	validates :league_id, presence: true

	def name
		User.find(self.user_id).name
	end
end
