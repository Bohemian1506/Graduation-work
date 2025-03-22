# frozen_string_literal: true

class Events::Info::BasicInfoComponentPreview < ViewComponent::Preview
  def default
    render(Events::Info::BasicInfoComponent.new(event: "event"))
  end
end
