class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :task_status
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
