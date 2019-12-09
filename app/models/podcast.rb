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
end
