class Book < ActiveRecord::Base
	has_many :chapters, :dependent => :destroy

	searchable do
		text :title, :default_boost => 2
		text :other
		integer :chapters_count
		string :author
		time :created_at
		time :updated_at
	end

	def to_s
		title
	end
end
