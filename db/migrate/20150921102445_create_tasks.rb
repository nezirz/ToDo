class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :active
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
