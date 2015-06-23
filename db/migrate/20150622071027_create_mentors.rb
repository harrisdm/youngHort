class CreateMentors < ActiveRecord::Migration
  def change
    create_table  :mentors do |t|
      t.text      :name
      t.text      :link
      t.text      :bio
      t.text      :image

      t.timestamps
    end
  end
end
