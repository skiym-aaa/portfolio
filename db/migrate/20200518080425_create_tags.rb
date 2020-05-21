class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :place_photo_id
      t.integer :event_photo_id

      t.timestamps
    end
  end
end
