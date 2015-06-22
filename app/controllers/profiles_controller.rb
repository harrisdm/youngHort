class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @profile = Profile.where(:user_id => current_user.id)
    @profile = @profile.first
  end

  def update
    #raise params.inspect
    # profile = Profile.where(:user_id => current_user.id)
    # profile = profile.first  
    profile = Profile.find(params[:profile][:id])       
    profile.update profile_params                       # Update the property
    redirect_to profiles_path(current_user.id)          # Return to the property page
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :age, :place_of_study, :course_of_study)
  end

end