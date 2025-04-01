class Events::Todo::ListComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  def initialize(event:, current_user:)
    @event = event
    @current_user = current_user
    @unfinished_tasks = event.tasks.unfinished
    @finished_tasks = event.tasks.finished
  end

  # このコンポーネントをレンダリングする条件
  def render?
    @current_user.present?  # ユーザーがログインしている場合のみ表示
  end
end
