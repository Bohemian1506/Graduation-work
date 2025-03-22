class Task < ApplicationRecord
  include Assignable

  belongs_to :event
  validates :title, presence: true

  enum task_status: {
    unfinished: 0,
    finished: 1
  }
end
