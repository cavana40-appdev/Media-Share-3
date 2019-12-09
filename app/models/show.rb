# == Schema Information
#
# Table name: shows
#
#  id          :integer          not null, primary key
#  comments    :text
#  description :text
#  genre_topic :string
#  source      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  users_id    :integer
#

class Show < ApplicationRecord
end
