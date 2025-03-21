# frozen_string_literal: true

class Events::Info::ActionButtonsComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
