class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :takeaway
      t.string :action
      t.string :sources
      t.timestamps
    end
  end
end
