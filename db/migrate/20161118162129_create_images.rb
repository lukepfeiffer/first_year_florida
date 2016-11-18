class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :description
      t.string :title
      t.boolean :rotate
    end
  end
end
