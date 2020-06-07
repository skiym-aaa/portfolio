class CreateIdols < ActiveRecord::Migration[5.2]
  def change
    create_table :idols do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :about, default: "description"
      t.string :official_site
      t.string :official_twitter
      t.string :official_youtube
      t.string :image_id
      t.text :default_image
      t.timestamps
    end
  end
end
