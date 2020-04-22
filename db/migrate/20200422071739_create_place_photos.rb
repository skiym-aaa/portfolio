class CreatePlacePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :place_photos do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.string :image_id
      t.timestamps
    end
  end
end
