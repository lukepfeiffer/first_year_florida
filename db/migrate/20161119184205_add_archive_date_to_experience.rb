class AddArchiveDateToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :archive_date, :datetime
  end
end
