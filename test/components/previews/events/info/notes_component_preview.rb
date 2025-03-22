# frozen_string_literal: true

class Events::Info::NotesComponentPreview < ViewComponent::Preview
  def default
    render(Events::Info::NotesComponent.new(event: "event"))
  end
end
