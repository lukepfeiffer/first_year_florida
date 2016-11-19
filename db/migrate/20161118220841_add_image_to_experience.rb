class AddImageToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :filepicker_url, :string
  end
end
