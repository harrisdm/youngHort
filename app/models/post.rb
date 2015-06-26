# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#  image1     :text
#  image2     :text
#  image3     :text
#  image4     :text
#  image5     :text
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :postimages
end
