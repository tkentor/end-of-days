class AddHeroToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :hero, :string
  end
end
