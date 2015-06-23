# == Schema Information
#
# Table name: ambassadors
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :string
#  context    :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ambassador < ActiveRecord::Base

  validates :name
  validates :loctaion
  validates :content
  validates :image

end
