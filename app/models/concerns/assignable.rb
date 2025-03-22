module Assignable
  extend ActiveSupport::Concern

  included do
    has_many :task_assignments, dependent: :destroy, as: :assignable
    has_many :users, through: :task_assignments
  end

  def has_assignees?
    users.exists?
  end

  def assignee_names
    if has_assignees?
      users.pluck(:username).join(", ")
    else
      "未割当"
    end
  end

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
