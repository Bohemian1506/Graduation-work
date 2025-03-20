class CreateTaskAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :task_assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # 同じタスクに同じユーザーが複数回割り当てられないようにするためのインデックス
    add_index :task_assignments, [ :task_id, :user_id ], unique: true
  end
end
