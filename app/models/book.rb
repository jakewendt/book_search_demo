class Book < ActiveRecord::Base
	has_many :chapters, :dependent => :destroy

#	searchable do
#		text :title, :default_boost => 2
#	end

	def to_s
		title
	end
end
