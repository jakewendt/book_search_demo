class CreateVerses < ActiveRecord::Migration
  def self.up
    create_table :verses do |t|
      t.integer :chapter_id
      t.integer :position
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :verses
  end
end
