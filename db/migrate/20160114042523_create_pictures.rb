class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :link

      t.timestamps null: false
    end
  end
end
