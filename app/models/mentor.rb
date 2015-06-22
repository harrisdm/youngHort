# == Schema Information
#
# Table name: mentors
#
#  id         :integer          not null, primary key
#  name       :text
#  link       :text
#  bio        :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Mentor < ActiveRecord::Base
end