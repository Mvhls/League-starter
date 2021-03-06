class Game < ActiveRecord::Base
	belongs_to :league
	belongs_to :home_team, class_name: "Team", foreign_key: 'home_team_id'
	belongs_to :away_team, class_name: "Team", foreign_key: 'away_team_id'
	has_many :stat_values

		def teams
			[home_team, away_team]
		end
end
