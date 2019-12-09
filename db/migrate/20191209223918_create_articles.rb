class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :link
      t.integer :users_id
      t.string :genre_topic
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end
