class CreateWords < ActiveRecord::Migration[8.1]
  def change
    create_table :words do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :text, null: false
      t.string :translation
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :words, [:lesson_id, :position]
  end
end
