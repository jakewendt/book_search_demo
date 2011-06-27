class Verse < ActiveRecord::Base
	acts_as_list :scope => :chapter
	belongs_to :chapter, :counter_cache => true

	searchable do
		text :body
		integer :chapter_id
		time :created_at
		time :updated_at
		string :author do 
			chapter.book.author
		end
	end

#	As nothing indexes any fields from the verse,
#	this is unnecessary.
#
#	after_save :index_book_and_chapter

	def to_s
		"#{chapter}:#{position}"
	end

protected

	def index_book_and_chapter
		chapter.index
		chapter.book.index
		Sunspot.commit
	end

end
