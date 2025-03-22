class Event < ApplicationRecord
  include EventEnums

belongs_to :user
has_many :tasks, dependent: :destroy

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
end
