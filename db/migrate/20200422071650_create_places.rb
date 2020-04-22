class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.text :about
      t.string :official_site
      t.string :place_image_id
      t.timestamps
    end
  end
end
