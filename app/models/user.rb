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
  def show_likes
    array_of_show_likes = self.likes.pluck(:shows_id)
    return Show.where({:id => array_of_show_likes})
  end
end
