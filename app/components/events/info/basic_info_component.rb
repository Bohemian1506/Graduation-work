# frozen_string_literal: true

class Events::Info::BasicInfoComponent < ViewComponent::Base
  include ActionView::Helpers::NumberHelper
  def initialize(event:)
    @event = event
  end
end
