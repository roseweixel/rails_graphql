class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
    add_index :notes, :title
  end
end
