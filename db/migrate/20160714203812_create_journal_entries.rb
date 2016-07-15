class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.text :content, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :journal_entries, :user_id
  end
end
