# frozen_string_literal: true

require "test_helper"

class Events::Info::StatusBadgeComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    # モックのイベントオブジェクトを作成
    event = Event.new(
      id: 1,
      title: "テストイベント",
      event_date: Time.now,
      store_name: "テストストア",
      user_id: 1
    )

    render_inline(Events::Info::BasicInfoComponent.new(event: event))
    # アサーションを書く
  end
end
