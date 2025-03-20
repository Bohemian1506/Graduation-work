class Task < ApplicationRecord
  belongs_to :event
  has_many :task_assignments, dependent: :destroy
  has_many :users, through: :task_assignments

  validates :title, presence: true

  # enum定義(完了か未完了を定義しています) 
  enum task_status: {
    unfinished: 0,   # 未完了
    finished: 1      # 完了済み
  }
end
