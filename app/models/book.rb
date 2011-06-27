class Book < ActiveRecord::Base
	has_many :chapters, :dependent => :destroy

	searchable do
		text :title, :default_boost => 2
		string :author
		time :created_at
	end

	def to_s
		title
	end
end
