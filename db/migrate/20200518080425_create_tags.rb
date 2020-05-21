class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :place_photo
      t.integer :event_photo

      t.timestamps
    end
  end
end
