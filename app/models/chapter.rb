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
		time :created_at
		time :updated_at
	end

	def to_s
		"#{book.title} #{position}"
	end
end
