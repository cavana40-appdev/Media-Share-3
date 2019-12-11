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
    return Book.where({ :id => self.books_id }).at(0)
  end

  def film
    return Film.where({ :id => self.films_id }).at(0)
  end

  def podcast
    return Podcast.where({ :id => self.podcasts_id }).at(0)
  end

  def shows
    return Show.where({ :id => self.shows_id }).at(0)
  end

  def article
    return Article.where({ :id => self.articles_id }).at(0)
  end
end
