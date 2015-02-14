class StatValue < ActiveRecord::Base
	belongs_to :stat_type
	belongs_to :game
end
