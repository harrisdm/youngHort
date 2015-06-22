# == Schema Information
#
# Table name: post_images
#
#  id      :integer          not null, primary key
#  image   :text
#  post_id :integer
#

class PostImages < ActiveRecord::Base
  belongs_to :post
end
