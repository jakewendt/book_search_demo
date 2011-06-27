class Chapter < ActiveRecord::Base
	acts_as_list :scope => :book
	belongs_to :book, :counter_cache => true
	has_many :verses, :dependent => :destroy

	searchable do
		text :title, :default_boost => 2
		integer :book_id
		time :created_at
	end

	def to_s
		"#{book.title} #{position}"
	end
end
