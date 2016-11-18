class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.date :date
      t.string :url
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
