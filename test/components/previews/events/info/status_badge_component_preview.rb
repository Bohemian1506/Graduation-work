# frozen_string_literal: true

class Events::Info::StatusBadgeComponentPreview < ViewComponent::Preview
  def default
    render(Events::Info::StatusBadgeComponent.new(event: "event"))
  end
end
