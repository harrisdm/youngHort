# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  name            :string
#  age             :integer
#  place_of_study  :text
#  course_of_study :text
#  user_id         :integer
#  admin           :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Profile < ActiveRecord::Base

  belongs_to :user
  
end
