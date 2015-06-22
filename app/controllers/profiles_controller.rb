class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @profile = get_current_profile
  end

  def update
    profile_id = params[:profile][:id]
    profile = Profile.find(profile_id)       
    profile.update profile_params 

    # Get uploaded file and push it to Cloudinary
    file = params[:profile][:image]
    unless file.blank?
      cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/profiles/#{ profile_id }", :unique_filename => true)
      profile.image = cl_info['public_id']
      profile.save
    end

    redirect_to profiles_path(current_user.id)
  end

  def delete_img
    profile = get_current_profile

    Cloudinary::Api.delete_resources(["youngHort/profiles/#{ profile[:id] }"])
    profile.image = nil
    profile.save

    redirect_to profiles_path(current_user.id)
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :age, :place_of_study, :course_of_study)
  end

  def get_current_profile
    profile = Profile.where(:user_id => current_user.id)
    return profile.first
  end

end