# == Schema Information
#
# Table name: posts
#
#  id      :integer          not null, primary key
#  title   :string
#  content :text
#  date    :date
#  image1  :text
#  image2  :text
#  image3  :text
#  image4  :text
#  image5  :text
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :postimages
end
