# frozen_string_literal: true

class Events::Info::StatusBadgeComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
