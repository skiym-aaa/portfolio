class CreatePlaceComments < ActiveRecord::Migration[5.2]
  def change
    create_table :place_comments do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text "body"
      t.float "rate"
      t.timestamps
    end
  end
end
