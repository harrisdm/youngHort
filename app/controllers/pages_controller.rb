class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @slides = Slideshow_image.where(active: true)
  end

  def secure
  end
end
