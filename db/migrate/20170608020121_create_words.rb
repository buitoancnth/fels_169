class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :content
      t.references :lesson_word, foreign_key: true
      t.references :cagetory, foreign_key: true

      t.timestamps null: false
    end
  end
end
