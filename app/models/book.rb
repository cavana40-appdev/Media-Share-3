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
end
