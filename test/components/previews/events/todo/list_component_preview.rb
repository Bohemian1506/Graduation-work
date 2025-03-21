# frozen_string_literal: true

class Events::Todo::ListComponentPreview < ViewComponent::Preview
  def default
    render(Events::Todo::ListComponent.new(event: "event"))
  end
end
