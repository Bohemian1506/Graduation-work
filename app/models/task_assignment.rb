class TaskAssignment < ApplicationRecord
  belongs_to :assignable, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: [ :assignable_id, :assignable_type ],
                                    message: "は既にこのタスクに割り当てられています" }
end
