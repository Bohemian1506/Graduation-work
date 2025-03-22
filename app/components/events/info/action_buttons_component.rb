class Events::Info::ActionButtonsComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers
  include Devise::Controllers::Helpers

  def initialize(event:, current_user:)
    @event = event
    @current_user = current_user
  end
end
