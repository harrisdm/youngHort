class AddVersionToTables < ActiveRecord::Migration
  def change
    add_column :mentors, :version, :string
    add_column :ambassadors, :version, :string
    add_column :profiles, :version, :string
  end
end
