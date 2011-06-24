class CreateChapters < ActiveRecord::Migration
	def self.up
		create_table :chapters do |t|
			t.integer :book_id
			t.integer :position
			t.integer :verses_count, :default => 0
			t.string :title
			t.timestamps
		end
	end

	def self.down
		drop_table :chapters
	end
end
