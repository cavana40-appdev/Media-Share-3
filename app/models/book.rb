# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  author      :string
#  comments    :text
#  description :text
#  genre_topic :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  users_id    :integer
#

class Book < ApplicationRecord
belongs_to :users, :class_name => "User"
has_many :likes, :foreign_key => "books_id", :dependent => :destroy

def poster
    poster_username = User.where({ :id => self.users_id }).pluck(:username)
    return poster_username[0]
  end
end
