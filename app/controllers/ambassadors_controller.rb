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

      save_cloudinary_AMP_image(file, @ambassador, "youngHort/ambassadors/")

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

      save_cloudinary_AMP_image(file, @ambassador, "youngHort/ambassadors/")
      
      redirect_to @ambassador
    else
      render :edit
    end
  end

  def delete_img
    ambassador = Ambassador.find params[:id]
    delete_cloudinary_AMP_image(ambassador, "youngHort/ambassadors/")
    redirect_to ambassador
  end

  def destroy
    @ambassador = Ambassador.find params[:id]
    delete_cloudinary_AMP_image(@ambassador, "youngHort/ambassadors/")
    @ambassador.destroy
    redirect_to ambassadors_path
  end


  private
    def ambassador_params
      params.require(:ambassador).permit(:name, :location, :bio)
    end

  end








