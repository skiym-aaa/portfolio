class CreateEventPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :event_photos do |t|

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :image_id
      t.timestamps
    end
  end
end
