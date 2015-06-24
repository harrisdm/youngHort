class MentorsController < ApplicationController
  before_action :authenticate_user! #Set from devise.
  before_action :check_if_admin, except: [:index, :show]
  
  def index
    @mentors = Mentor.order(created_at: :desc)
  end

  def show
    @mentor = Mentor.find params[:id]
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new mentor_params
    if @mentor.save
      # Get the file name from the submitted form
      file = params[:mentor][:image]

      save_cloudinary_AMP_image(file, @mentor, "youngHort/mentors/")

      redirect_to @mentor
    else
      render :new
    end
  end

  def edit
    @mentor = Mentor.find params[:id]
  end

  def update
    @mentor = Mentor.find params[:id]

    if @mentor.update mentor_params

      # Get the file name from the submitted form
      file = params[:mentor][:image]

      save_cloudinary_AMP_image(file, @mentor, "youngHort/mentors/")

      redirect_to @mentor
    else
      render :edit
    end
  end

  def delete_img
    mentor = Mentor.find params[:id]
    delete_cloudinary_AMP_image(mentor, "youngHort/mentors/")
    redirect_to mentor
  end

  def destroy
    @mentor = Mentor.find params[:id]
    delete_cloudinary_AMP_image(mentor, "youngHort/mentors/")
    @mentor.destroy
    redirect_to mentors_path
  end


  private
    def mentor_params
      params.require(:mentor).permit(:name, :bio, :link)
    end
    
  end
