class AddTakeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :take, :string
  end
end
