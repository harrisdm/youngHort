# == Schema Information
#
# Table name: ambassadors
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :string
#  bio        :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  version    :string
#

class Ambassador < ActiveRecord::Base

  # validates :name, presence: true
  # validates :loctaion, presence: true
  # validates :bio, presence: true
  # validates :image, presence: true

end
