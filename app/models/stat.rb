class Stat < ActiveRecord::Base
	belongs_to :source_id, polymorphic: true
end
