class League < ActiveRecord::Base
	VALID_LEAGUE_NAME_REGEX = /\w\s/
	validates :name, presence: true, length: { maximum: 30 }, 
						format: { with: VALID_LEAGUE_NAME_REGEX }, 
						uniqueness: { case_sensitive: false }
end
