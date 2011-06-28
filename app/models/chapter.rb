class Chapter < ActiveRecord::Base
	acts_as_list :scope => :book
	belongs_to :book, :counter_cache => true
	has_many :verses, :dependent => :destroy

	searchable do
		text :title, :default_boost => 2
		integer :book_id
		integer :verses_count
		string :author do
			book.author
		end
		text :body do
			verses.map {|v|
				v.body
			}
		end
		time :created_at
		time :updated_at
	end

#	As the verse does not index anything from a chapter,
#	this is unnecessary.
#	Actually, not true anymore.
#
#	after_save :index_book_and_verses

	def to_s
		"#{book.title} #{position}"
	end

protected

	def index_book_and_verses
		book.index
#		verses.index
		verses.each do |v|
			v.index
		end
		Sunspot.commit
	end

end
