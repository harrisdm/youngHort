class AmbassadorController < ApplicationController

  before_action :set_screen

  def set_screen 
    @current_screen = "ambassador"
  end

  def index
    @ambassador = Ambassador.all

  end

  def show
    @ambassador = Ambassador.find params[:id]
  end

  def new
    @ambassador = ambassador.new
  end

  def create
     @ambassador = Ambassador.new ambassador_params

    if @ambassador.save
      redirect_to root_path
    
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
    Ambassador.update ambassador_params
    redirect_to @ambassador
    #redirect to the newly edited ambassador page
  end

  def destroy
    @ambassador = Ambassador.find params[:id]
    ambassador.destroy
    redirect_to mentors_path
  end
end

  private

    def set_ambassador
      @ambassador = Ambassador.find(params[:id])
    end


    def ambassador_params
      params.require(:ambassador).permit(:name, :location, :content, :image)
    end
end