class ProfilesController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    # Strip the fields out of the resource params and save them to 
    # another model then you can call super to have the method behave as it normal:
    #raise params.inspect
    
    # @profile = Profile.create(profile_params)
    # @profile.save
    super 
  end

  def update
    super
  end


  private
  def profile_params
    params.require(:user).require(:profile).permit(:name, :age, :place_of_study, :course_of_study)
  end
end