class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :lists, [:board_id, :created_at]
  end
end
