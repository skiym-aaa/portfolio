class CreateEventComments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_comments do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :body
      t.decimal :score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
