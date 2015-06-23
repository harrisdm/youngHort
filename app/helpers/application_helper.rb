module ApplicationHelper

  def intellinav
    nav = ''
    if current_user.present? && current_user.profile.admin?
      nav += '<li>' + link_to('All posts', '/posts')
      nav += '<li>' + link_to('New post', '/posts/new')
      nav += '<li>' + link_to('All mentors', '/mentors')
      nav += '<li>' + link_to('New mentor', '/mentors/new')
      nav += '<li>' + link_to('All ambassadors', '/ambassadors')
      nav += '<li>' + link_to('New ambassador', '/ambassadors/new')
    end
  end

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
