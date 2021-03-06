class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
