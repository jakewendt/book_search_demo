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

#	The point is that if the 'author' changes, then the 
#		chapter and verse author is no longer correct.
#
#	This is effective, but does take several seconds
#	Should only call when necessary, and perhaps in the 
#		background to avoid the delay.
#	Create backgroundrd worker and set "reindex_my_associations" flag?
	after_save :index_chapters_and_verses

	def to_s
		title
	end

protected

	def index_chapters_and_verses
#	takes about 15 seconds to update all of Psalms
		chapters.index
		chapters.each do |c|
#			c.index
#			c.verses.each do |v|
#				v.index
#			end
			c.verses.index
		end
		Sunspot.commit
	end

end
