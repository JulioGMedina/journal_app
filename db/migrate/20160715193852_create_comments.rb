class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :journal_entry_id, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :journal_entry_id
  end
end
