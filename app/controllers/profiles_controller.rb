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
    
    if profile.update profile_params 

      # Get the file name from the submitted form
      file = params[:profile][:image]

      save_cloudinary_AMP_image(file, profile, "youngHort/profiles/")

      redirect_to profiles_path(current_user.id)
    else
      render :edit
    end
  end

  def delete_img
    profile = get_current_profile
    delete_cloudinary_AMP_image(profile, "youngHort/profiles/")
    # Cloudinary::Api.delete_resources(["youngHort/profiles/#{ profile[:id] }"])
    # profile.image = nil
    # profile.save

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