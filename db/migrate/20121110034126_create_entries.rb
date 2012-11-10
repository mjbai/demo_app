class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :word
      t.string :def
      t.integer :user_id

      t.timestamps
    end
  end
end
