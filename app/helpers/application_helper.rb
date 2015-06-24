module ApplicationHelper

  # Supply a default profile image if one is not supplied
  def profile_image_link(source)
    # if source.image.blank?
    #   return "http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif" 
    # else
    #   return source.image
    # end
  end

  def fetch_profile_image(image)
    if image.blank?
      return image_tag("http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif", size: "90x90", alt: "Profile Image")
    else
      return cl_image_tag(image, :alt => "Profile Image", :width => 90, :height => 90, :crop => :thumb, :gravity => :face, :version => 1)
    end
  end

  def fetch_profile_image_model(model)
    if model.image.blank?
      return image_tag("http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif", size: "100x100", alt: "Profile Image", class: "img-circle padded_img")
    else
      return cl_image_tag(model.image, :alt => "Profile Image", :width => 100, :height => 100, :crop => :thumb, :gravity => :face, :version => model.version, :class => "img-circle padded_img")
    end
  end

  def fetch_slidshow_image_thumb(image)
    if image.blank?
      return image_tag("http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif", size: "90x90", alt: "Profile Image")
    else
      return cl_image_tag(image, :alt => "Slidshow Image", :width => 200, :height => 100, :crop => :thumb)
    end
  end

  # def self.g_cloudinary_filename( file )
  #   require 'securerandom'
  #   rand = SecureRandom.urlsafe_base64(5)
  #   filename = file.original_filename.split(".").tap(&:pop).join
  #   return filename + "_" + rand
  # end

  # def g_cloudinary_filename(file)
  #   require 'securerandom'
  #   rand = SecureRandom.urlsafe_base64(5)
  #   filename = file.original_filename.split(".").tap(&:pop).join
  #   return filename + "_" + rand
  # end

end










