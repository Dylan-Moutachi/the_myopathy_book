class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :author
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
