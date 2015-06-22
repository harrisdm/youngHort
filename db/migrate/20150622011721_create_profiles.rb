class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.string    :name
      t.integer   :age
      t.text      :place_of_study
      t.text      :course_of_study
      t.integer   :user_id
      t.boolean   :admin,         :default => true

      t.timestamps null: false
    end
  end
end
