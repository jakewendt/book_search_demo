class Verse < ActiveRecord::Base
	acts_as_list :scope => :chapter
	belongs_to :chapter, :counter_cache => true

	searchable do
		text :body
		integer :chapter_id
	end

	def to_s
		position	#body
	end
end
