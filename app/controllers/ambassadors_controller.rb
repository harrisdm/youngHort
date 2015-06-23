class AmbassadorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, except: [:index, :show]

  def index
    @ambassadors = Ambassador.order(created_at: :desc)
  end

  def show
    @ambassador = Ambassador.find params[:id]
  end

  def new
    @ambassador = Ambassador.new
  end

  def create
     @ambassador = Ambassador.new ambassador_params
    if @ambassador.save
      # Get the file name from the submitted form
      file = params[:ambassador][:image]

      unless file.blank?
        # Upload the file to Cloudinary with the path and filename
        cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/ambassadors/#{@ambassador.id}")

        if cl_info
          # Upload successful: add image to the database with the Cloudinary ID
          @ambassador.image = cl_info['public_id']
          @ambassador.version = cl_info['version']
          @ambassador.save
        end

      end
      redirect_to @ambassador
    else
      render :new
    end
  end

  def edit
    @ambassador = Ambassador.find params[:id]
  end

  def update
    @ambassador = Ambassador.find params[:id]
    
    if @ambassador.update ambassador_params

      # Get the file name from the submitted form
      file = params[:ambassador][:image]

      unless file.blank?
        # Upload the file to Cloudinary with the path and filename
        cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/ambassadors/#{@ambassador.id}")

        if cl_info
          # Upload successful: add image to the database with the Cloudinary ID
          @ambassador.image = cl_info['public_id']
          @ambassador.version = cl_info['version']
          @ambassador.save
        end

      end
      redirect_to @ambassador
    else
      render :edit
    end
  end

  def destroy
    @ambassador = Ambassador.find params[:id]
    @ambassador.destroy
    redirect_to ambassadors_path
  end

  def delete_img
    ambassador = Ambassador.find params[:id]
    Cloudinary::Api.delete_resources(["youngHort/ambassadors/#{ ambassador.id }"])
    ambassador.image = nil
    ambassador.save
    redirect_to ambassador
  end

  private
    def ambassador_params
      params.require(:ambassador).permit(:name, :location, :context, :image)
    end
  end