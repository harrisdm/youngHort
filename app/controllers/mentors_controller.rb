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

      unless file.blank?
        # Upload the file to Cloudinary with the path and filename
        cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/mentors/#{@mentor.id}")

        if cl_info
          # Upload successful: add image to the database with the Cloudinary ID
          @mentor.image = cl_info['public_id']
          @mentor.version = cl_info['version']
          @mentor.save
        end

      end
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

      unless file.blank?
        # Upload the file to Cloudinary with the path and filename
        cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/mentors/#{@mentor.id}")

        if cl_info
          # Upload successful: add image to the database with the Cloudinary ID
          @mentor.image = cl_info['public_id']
          @mentor.version = cl_info['version']
          @mentor.save
        end

      end
      redirect_to @mentor
    else
      render :edit
    end
  end

  def destroy
    @mentor = Mentor.find params[:id]
    @mentor.destroy
    redirect_to mentors_path
  end

  def delete_img
    mentor = Mentor.find params[:id]
    Cloudinary::Api.delete_resources(["youngHort/mentors/#{ mentor.id }"])
    mentor.image = nil
    mentor.save
    redirect_to mentor
  end

  private
    def mentor_params
      params.require(:mentor).permit(:name, :bio, :link)
    end
  end
