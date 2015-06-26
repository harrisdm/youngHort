class PagesController < ApplicationController

  def home
    @slides = Slideshow_image.where(active: true)
    @ambassadors = Ambassador.all
  end

end
