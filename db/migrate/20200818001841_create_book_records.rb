class CreateBookRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :book_records do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.string :img_url

      t.timestamps
    end
  end
end