class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :action_type
      t.string :content_action
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
