# frozen_string_literal: true

class Events::Info::ActionButtonsComponentPreview < ViewComponent::Preview
  def default
    render(Events::Info::ActionButtonsComponent.new(event: "event"))
  end
end
