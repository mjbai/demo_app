class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :word
      t.text :context
      t.text :definition
      t.text :example_sentence
      t.string :image
      t.integer :user_id

      t.timestamps
    end
    add_index :entries, [:user_id, :created_at]
  end
end
