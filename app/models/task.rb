class Task < ApplicationRecord
  belongs_to :event
  has_many :task_assignments, dependent: :destroy
  has_many :users, through: :task_assignments

  validates :title, presence: true

  # enum定義(完了か未完了を定義)
  enum task_status: {
    unfinished: 0,   # 未完了
    finished: 1      # 完了済み
  }

  # タスクに担当者がいるかを確認するメソッド
  def has_assignees?
    users.exists?
  end

  # タスクの担当者の名前を表示するメソッド（複数人いる場合はカンマ区切り）
  def assignee_names
    if has_assignees?
      users.pluck(:username).join(", ")
    else
      "未割当"
    end
  end

  # 担当者をセットするメソッド
  def assign_users(user_ids)
    return unless user_ids.present?

    # 現在の担当者を一旦削除
    task_assignments.destroy_all

    # 新しい担当者を設定
    user_ids.each do |user_id|
      next if user_id.blank?
      task_assignments.create(user_id: user_id)
    end
  end
end
