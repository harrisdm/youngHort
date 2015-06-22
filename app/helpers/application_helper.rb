module ApplicationHelper

  # Supply a defualt profile image if one is not supplied
  def profile_image_link(source)
    if source.image.blank?
      return "http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif" 
    else
      return source.image
    end
  end

  def fetch_profile_image(image)
    if image.blank?
      return image_tag("http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif", size: "90x90", alt: "Profile Image")
    else
      return cl_image_tag(image, :alt => "Profile Image", :width => 90, :height => 90, :crop => :thumb, :gravity => :face)
    end
  end

end
