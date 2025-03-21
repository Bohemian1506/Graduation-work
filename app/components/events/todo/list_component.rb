# frozen_string_literal: true

class Events::Todo::ListComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
