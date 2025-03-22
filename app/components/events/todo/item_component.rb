class Events::Todo::ItemComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  def initialize(task:, event:, current_user: nil)
    @task = task
    @event = event
    @current_user = current_user
  end
end
