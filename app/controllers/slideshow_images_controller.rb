class SlideshowImagesController < ApplicationController
  
  def index
    @images = Slideshow_image.order(id: :asc)
  end

  def new
    @image = Slideshow_image.new
  end

  def create
    @image = Slideshow_image.new

    # Get the file name from the submitted form
    file = params[:slideshow_image][:image]

    if file.blank?
      # Display the new image form
      render :new
    else
      # Generate the unique cloudinary filename from the helper
      filename = g_cloudinary_filename(file)

      # Upload the file to Cloudinary with the path and filename
      cl_info = Cloudinary::Uploader.upload(file, :public_id => "youngHort/slideshow/#{filename}")

      if cl_info
        # Upload successful: add image to the database with the Cloudinary ID
        @image = Slideshow_image.create slideshow_image_params
        @image.image = cl_info['public_id']
        @image.save

        # Display the list of images
        redirect_to slideshow_images_path 
      else
        # Display the new image form
        render :new
      end
    end
  end

  # Remove the image from Cloudinary and delete the database entry
  def destroy
    image = Slideshow_image.find(params[:id])
    Cloudinary::Api.delete_resources([image.image])
    image.destroy
    redirect_to slideshow_images_path
  end

  # Include the image in the slider selection
  def enable
    image = Slideshow_image.find(params[:id])
    image.active = true
    image.save
    redirect_to slideshow_images_path
  end

  # Exclude the image from the slider selection
  def disable
    image = Slideshow_image.find(params[:id])
    image.active = false
    image.save
    redirect_to slideshow_images_path
  end

  
  private

  def slideshow_image_params
    params.require(:slideshow_image).permit(:description, :active)
  end

end
