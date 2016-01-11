class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.string :link
      t.text :excerpt

      t.timestamps null: false
    end
  end
end
