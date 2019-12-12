# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates(:username, { :presence => true, :case_sensitive => false })
  has_secure_password

  def likes
    return Like.where({ :users_id => self.id })
  end

  def book_likes
    array_of_book_likes = self.likes.pluck(:books_id)
    return Book.where({:id => array_of_book_likes})
  end
  def book_title
    book_title = book_likes.pluck(:title)
    return book_title[0].to_s
  end
  def show_likes
    array_of_show_likes = self.likes.pluck(:shows_id)
    return Show.where({:id => array_of_show_likes})
  end
  def show_title
    show_title = show_likes.pluck(:title)
    return show_title[0].to_s
  end
  def podcast_likes
    array_of_podcast_likes = self.likes.pluck(:podcasts_id)
    return Podcast.where({:id => array_of_podcast_likes})
  end
  def podcast_title
    podcast_title = podcast_likes.pluck(:title)
    return podcast_title[0].to_s
  end
  def article_likes
    array_of_article_likes = self.likes.pluck(:articles_id)
    return Article.where({:id => array_of_article_likes})
  end
  def article_title
    article_title = article_likes.pluck(:title)
    return article_title[0].to_s
  end
  def film_likes
    array_of_film_likes = self.likes.pluck(:films_id)
    return Film.where({:id => array_of_film_likes})
  end
  def film_title
    film_title = film_likes.pluck(:title)
    return film_title[0].to_s
  end

  def own_books
    return Book.where({:users_id => self.id})
  end
  def own_articles
    return Article.where({:users_id => self.id})
  end
  def own_films
    return Film.where({:users_id => self.id})
  end
   def own_podcasts
    return Podcast.where({:users_id => self.id})
  end
  def own_shows
    return Show.where({:users_id => self.id})
  end
end
