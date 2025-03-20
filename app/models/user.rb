class User < ApplicationRecord
  has_many :events
  has_many :task_assignments, dependent: :destroy
  has_many :tasks, through: :task_assignments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # ユーザー名のバリデーション
  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 20 },
    format: {
      with: /\A[a-zA-Z0-9_]+\z/,
      message: "は英数字とアンダースコア(_)のみ使用できます"
    }
end
