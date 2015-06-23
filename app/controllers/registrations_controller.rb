class RegistrationsController < Devise::RegistrationsController
 
  def new
    build_resource({})
    #create the user
    self.resource.profile = Profile.new
    #create a new profile with user nested profile
    respond_with self.resource
    #link to itself
  end

  def create
    super
  end


  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, [profile_attributes: [:name, :age, :place_of_study, :course_of_study]]]
    params.require(:user).permit(allow)
  end

end