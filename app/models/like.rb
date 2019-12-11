# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  articles_id :integer
#  books_id    :integer
#  films_id    :integer
#  podcasts_id :integer
#  shows_id    :integer
#  users_id    :integer
#

class Like < ApplicationRecord
belongs_to :users, :class_name => "User"
belongs_to :books, :required => false, :class_name => "Book"
belongs_to :shows, :required => false, :class_name => "Show"
belongs_to :articles, :required => false, :class_name => "Article"
belongs_to :podcasts, :required => false, :class_name => "Podcast"
belongs_to :films, :required => false, :class_name => "Film"

def fan
    return User.where({ :id => self.users_id }).at(0)
  end

def book
    book_title = Book.where({ :id => self.books_id }).pluck(:title)
    return book_title[0].to_s
  end

  def book_poster
   book_user = Book.where({:id => self.books_id}).pluck(:users_id)
   poster = User.where({:id => book_user}).pluck(:username)
   return poster[0].to_s
  end

  def film
    film_title = Film.where({ :id => self.films_id }).pluck(:title)
    return film_title[0].to_s
  end

  def film_poster
   film_user = Film.where({:id => self.films_id}).pluck(:users_id)
   poster = User.where({:id => film_user}).pluck(:username)
   return poster[0].to_s
  end

  def podcast
    podcast_title = Podcast.where({ :id => self.podcasts_id }).pluck(:title)
    return podcast_title[0].to_s
  end

  def podcast_poster
   podcast_user = Podcast.where({:id => self.podcasts_id}).pluck(:users_id)
   poster = User.where({:id => podcast_user}).pluck(:username)
   return poster[0].to_s
  end

  def show
    show_title = Show.where({ :id => self.shows_id }).pluck(:title)
    return show_title[0].to_s
  end

  def show_poster
   show_user = Show.where({:id => self.shows_id}).pluck(:users_id)
   poster = User.where({:id => show_user}).pluck(:username)
   return poster[0].to_s
  end

  def article
    article_title = Article.where({ :id => self.articles_id }).pluck(0)
    return article_title[0].to_s
  end

  def article_poster
   article_user = Film.where({:id => self.articles_id}).pluck(:users_id)
   poster = User.where({:id => article_user}).pluck(:username)
   return poster[0].to_s
  end
end
