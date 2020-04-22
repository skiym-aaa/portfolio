class CreateIdols < ActiveRecord::Migration[5.2]
  def change
    create_table :idols do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :about
      t.string :official_site
      t.string :idol_image_id
      t.timestamps
    end
  end
end
