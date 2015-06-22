# == Schema Information
#
# Table name: posts
#
#  id      :integer          not null, primary key
#  title   :string
#  content :text
#  date    :date
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :postimages
end
