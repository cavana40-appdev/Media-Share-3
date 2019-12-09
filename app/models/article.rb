# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  author      :string
#  comments    :text
#  description :text
#  genre_topic :string
#  link        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  users_id    :integer
#

class Article < ApplicationRecord
end
