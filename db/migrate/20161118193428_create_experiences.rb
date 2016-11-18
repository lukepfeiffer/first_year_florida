class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.date :date
      t.string :image_url
      t.string :title
      t.integer :user_id
      t.text :description
      t.timestamps
    end
  end
end
