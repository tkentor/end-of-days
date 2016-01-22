class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.belongs_to :article, index: true, foreign_key: true
      t.belongs_to :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
