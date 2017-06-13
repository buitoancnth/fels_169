class CreateLessonWords < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_words do |t|
      t.references :word, foreign_key: true
      t.references :lesson, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps null: false
    end
  end
end
