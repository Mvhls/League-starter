class Team < ActiveRecord::Base
	belongs_to :league
	has_many :players
	
	validates :league_id, presence: true
	VALID_TEAM_NAME_REGEX = /\A[\w\s]+\Z/
	validates :name, presence: true, length: { maximum: 30 }, format: { with: VALID_TEAM_NAME_REGEX }
	validates_uniqueness_of :name, scope: :league_id # your team name from your league can be the same as team names from another league, but not the same league
end
