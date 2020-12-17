class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string "title"
      t.string "content"
      t.datetime "date_edited"
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
