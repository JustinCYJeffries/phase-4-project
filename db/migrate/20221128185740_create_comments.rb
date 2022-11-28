class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint "user_id", null: false
      t.bigint "helpme_id", null: false
      t.text "comment"
      t.index ["helpme_id"], name: "index_comments_on_helpme_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
      t.timestamps
    end
  end
end
