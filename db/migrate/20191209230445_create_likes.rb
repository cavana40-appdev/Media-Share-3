class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :users_id
      t.integer :films_id
      t.integer :shows_id
      t.integer :podcasts_id
      t.integer :articles_id
      t.integer :books_id

      t.timestamps
    end
  end
end
