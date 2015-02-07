class StatType < ActiveRecord::Base
	belongs_to :league
	has_many :stat_values

	VALID_STAT_TYPE_NAME_REGEX = /\A[\w\s]+\Z/
	validates :name, presence: true, length: { maximum: 30 }, 
						format: { with: VALID_STAT_TYPE_NAME_REGEX }, 
						uniqueness: { case_sensitive: false }
end
