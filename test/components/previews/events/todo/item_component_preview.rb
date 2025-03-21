# frozen_string_literal: true

class Events::Todo::ItemComponentPreview < ViewComponent::Preview
  def default
    render(Events::Todo::ItemComponent.new(task: "task", event: "event"))
  end
end
