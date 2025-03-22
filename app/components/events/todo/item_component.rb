# frozen_string_literal: true

class Events::Todo::ItemComponent < ViewComponent::Base
  def initialize(task:, event:)
    @task = task
    @event = event
  end
end
