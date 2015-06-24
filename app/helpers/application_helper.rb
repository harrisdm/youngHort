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
    if current_user.present? 
      nav += '<li>' + link_to('Home', '/')
      nav += '<li>' + link_to('Mentors', '/mentors')
      nav += '<li>' + link_to('Blog', '/posts')
      nav += '<li>' + link_to("Log Out", destroy_user_session_path, method: :delete)
    else
      nav += '<li>' + link_to('Home', '/')
      nav += '<li>' + link_to('Login', '/users/sign_in')
    end
  end

  # Supply a default profile image if one is not supplied
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
      return cl_image_tag(image, :alt => "Profile Image", :width => 90, :height => 90, :crop => :thumb, :gravity => :face, :version => 1)
    end
  end

  def fetch_profile_image_model(model)
    if model.image.blank?
      return image_tag("http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif", size: "90x90", alt: "Profile Image")
    else
      return cl_image_tag(model.image, :alt => "Profile Image", :width => 90, :height => 90, :crop => :thumb, :gravity => :face, :version => model.version)
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










