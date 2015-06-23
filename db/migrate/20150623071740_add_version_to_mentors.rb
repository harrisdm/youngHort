class AddVersionToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :version, :string
  end
end
