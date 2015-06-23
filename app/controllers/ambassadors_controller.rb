class AmbassadorsController < ApplicationController

  # before_action :set_screen

  # def set_screen 
  #   @current_screen = "ambassador"
  # end

  def index
    @ambassadors = Ambassador.all
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
      redirect_to ambassadors_path
    
    else
      render :new
    end
  end

  def edit
    @ambassador = Ambassador.find params[:id]
    render :edit
  end

  def update
    @ambassador = Ambassador.find params[:id]
    @ambassador.update ambassador_params
    redirect_to @ambassador
    #redirect to the newly edited ambassador page
  end

  def destroy
    @ambassador = Ambassador.find params[:id]
    @ambassador.destroy
    redirect_to ambassadors_path
  end

  private

    def set_ambassador
      @ambassador = Ambassador.find(params[:id])
    end


    def ambassador_params
      params.require(:ambassador).permit(:name, :location, :context, :image)
    end
  end