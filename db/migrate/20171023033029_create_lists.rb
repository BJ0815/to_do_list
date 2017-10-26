class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.date :date
      t.text :note
      t.timestamps
    end
  end
end
