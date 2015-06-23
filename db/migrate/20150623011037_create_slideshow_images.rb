class CreateSlideshowImages < ActiveRecord::Migration
  def change
    create_table  :slideshow_images do |t|
      t.string    :image
      t.string    :description
      t.boolean   :active

      t.timestamps
    end
  end
end
