class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.references :cagetory, foreign_key: true
      t.boolean :is_learned defaul: false

      t.timestamps null:false
    end
  end
end
