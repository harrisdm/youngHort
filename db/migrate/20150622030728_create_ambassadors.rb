class CreateAmbassadors < ActiveRecord::Migration
  def change
    create_table  :ambassadors do |t|
      t.string    :name
      t.string    :location
      t.text      :bio
      t.string    :image

      t.timestamps null: false
    end
  end
end
