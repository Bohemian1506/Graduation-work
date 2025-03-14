class Event < ApplicationRecord
belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :event_date, presence: true
  validates :store_name, presence: true

  def formatted_text_for_clipboard
  lines = []
    lines << title
    lines << "日時: #{I18n.l(event_date, format: :long)}" if event_date.present?
    lines << "場所: #{store_name}" if store_name.present?
    lines << "住所: #{location}" if location.present?
    lines << "定員: #{capacity}名" if capacity.present?
    lines << "会費: #{party_fee}円" if party_fee.present?
    lines << "形式: #{party_type_i18n}" if party_type.present?
    lines << "" # 空行
    lines << notes if notes.present?

    lines.join("\n")
  end

  # enum定義
  enum party_type: {
    nomikai: 0,     # 一般的な飲み会
    enkai: 1,       # 宴会
    bonenkai: 2,    # 忘年会
    shinnenkai: 3,  # 新年会
    welcome: 4,     # 歓迎会
    farewell: 5,    # 送別会
    other: 6        # その他
  }

  enum event_status: {
    planning: 0,    # 計画中
    preparing: 1,   # 準備中
    recruiting: 2,  # 参加者募集中
    confirmed: 3,   # 確定済み
    completed: 4,   # 開催済み
    canceled: 5     # キャンセル
  }

  enum visibility: {
    public_event: 0,      # 全体公開
    private_event: 1,     # 非公開（共同幹事のみ）
    draft: 2        # 下書き（自分だけ）
  }
end
