# frozen_string_literal: true

class Events::Info::CopyButtonComponentPreview < ViewComponent::Preview
  def default
    render(Events::Info::CopyButtonComponent.new(event: "event"))
  end
end
