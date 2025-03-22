class MakeTaskAssignmentsPolymorphic < ActiveRecord::Migration[7.2]
  def change
    rename_column :task_assignments, :task_id, :assignable_id
    add_column :task_assignments, :assignable_type, :string

    # 既存のレコードを更新
    execute("UPDATE task_assignments SET assignable_type = 'Task'")

    # NULL不許可制約を追加
    change_column_null :task_assignments, :assignable_type, false

    # インデックスを更新
    remove_index :task_assignments, [ :task_id, :user_id ] if index_exists?(:task_assignments, [ :task_id, :user_id ])
    add_index :task_assignments, [ :assignable_id, :assignable_type, :user_id ], unique: true, name: 'index_assignments_on_assignable_and_user'
  end
end
