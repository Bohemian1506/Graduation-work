# frozen_string_literal: true

class Events::Info::NotesComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end
end
