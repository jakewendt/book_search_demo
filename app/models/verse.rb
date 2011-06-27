class Verse < ActiveRecord::Base
	acts_as_list :scope => :chapter
	belongs_to :chapter, :counter_cache => true

	searchable do
		text :body
		integer :chapter_id
		time :created_at
	end

	def to_s
		"#{chapter}:#{position}"
	end
end
