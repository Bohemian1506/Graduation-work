# frozen_string_literal: true

class Events::Info::BasicInfoComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
