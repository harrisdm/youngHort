class RegistrationsController < Devise::RegistrationsController
 
  def new
    build_resource({})
    self.resource.profile = Profile.new
    respond_with self.resource
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