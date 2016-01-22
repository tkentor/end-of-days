class AddSourceColumnToCitations < ActiveRecord::Migration
  def change
    add_column :citations, :source, :string
  end
end
