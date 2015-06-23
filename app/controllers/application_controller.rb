class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_if_admin
    redirect_to root_path unless current_user.present? && current_user.profile.admin?
  end




  # Used to save Ambassador, Mentor & Profile images on Cloudinary
  def save_cloudinary_AMP_image(file, resource, path)
    unless file.blank?
      # Upload the file to Cloudinary with the path and filename
      cl_info = Cloudinary::Uploader.upload(file, :public_id => path + resource.id.to_s)

      if cl_info
        # Upload successful: add image to the database with the Cloudinary ID
        resource.image = cl_info['public_id']
        resource.version = cl_info['version']
        resource.save
      end
    end
  end

  # Used to delete Ambassador, Mentor & Profile images on Cloudinary
  def delete_cloudinary_AMP_image(resource, path)
    Cloudinary::Api.delete_resources([path + resource.id.to_s])
    resource.image = nil
    resource.save
  end

  def g_cloudinary_filename(file)
    require 'securerandom'
    rand = SecureRandom.urlsafe_base64(5)
    filename = file.original_filename.split(".").tap(&:pop).join
    return filename + "_" + rand
  end

end
