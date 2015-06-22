class AddImagesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image1, :text
    add_column :posts, :image2, :text
    add_column :posts, :image3, :text
    add_column :posts, :image4, :text
    add_column :posts, :image5, :text
  end
end
