class AddRatingToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :rating, :string
  end
end
