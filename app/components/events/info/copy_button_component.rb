# frozen_string_literal: true

class Events::Info::CopyButtonComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
