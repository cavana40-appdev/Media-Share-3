# == Schema Information
#
# Table name: podcasts
#
#  id               :integer          not null, primary key
#  comments         :text
#  description      :text
#  favorite_episode :string
#  genre_topic      :string
#  source           :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  users_id         :integer
#

class Podcast < ApplicationRecord
belongs_to :users, :class_name => "User"
has_many :likes, :foreign_key => "podcasts_id", :dependent => :destroy

def poster
    poster_username = User.where({ :id => self.users_id }).pluck(:username)
    return poster_username[0]
  end
end
