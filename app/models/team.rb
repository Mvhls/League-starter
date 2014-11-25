class Team < ActiveRecord::Base
	belongs_to :league
	validates :league_id, presence: true
	VALID_TEAM_NAME_REGEX = /\w\s/
	validates :name, presence: true, length: { maximum: 30 }, format: { with: VALID_TEAM_NAME_REGEX }
	validates_uniqueness_of :name, scope: :league_id # your team name from your league can be the same as team names from another league, but not the same league
end
