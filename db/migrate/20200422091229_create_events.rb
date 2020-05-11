class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :idol, foreign_key: true
      t.references :place, foreign_key: true
      t.string :title
      t.integer :genre
      t.string :body
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
