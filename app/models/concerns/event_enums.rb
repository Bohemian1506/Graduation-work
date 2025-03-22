module EventEnums
  extend ActiveSupport::Concern

  included do
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
end
