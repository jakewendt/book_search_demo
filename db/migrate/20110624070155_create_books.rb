class CreateBooks < ActiveRecord::Migration
	def self.up
		create_table :books do |t|
			t.integer :chapters_count, :default => 0
			t.string :title
			t.string :author
			t.text :other
			t.timestamps
		end
	end

	def self.down
		drop_table :books
	end
end
