class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :source
      t.string :favorite_episode
      t.integer :users_id
      t.string :genre_topic
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end
