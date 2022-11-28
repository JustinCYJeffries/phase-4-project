class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string "imageURL"
      t.string "title"
      t.string "description"
      t.string "publicationDate"
      t.string "genres"
      t.text "publisher"
      t.timestamps
    end
  end
end
