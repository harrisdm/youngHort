class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new mentor_params
    @mentor.save
    redirect_to mentors_path
  end

  def edit
    @mentor = Mentor.find params[:id]
    render :edit
  end

  def show
    @mentor = Mentor.find params[:id]
  end

  def update
    @mentor = Mentor.find params[:id]
    @mentor.update mentor_params
    redirect_to @mentor
    #redirect to the newly edited mentor page
  end

  def destroy
    @mentor = Mentor.find params[:id]
    @mentor.destroy
    redirect_to mentors_path
  end

  private
  def mentor_params
    params.require(:mentor).permit(:name, :image, :bio, :link)
  end
end
