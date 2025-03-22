module Events
  module Info
    class ActionButtonsComponent < ViewComponent::Base
      attr_reader :event, :current_user
      def initialize(event:, current_user:)
        @event = event
        @current_user = current_user
      end
      
      def render?
        current_user && current_user.id == event.user_id
      end

      def confirm_message
        "このイベントを削除してもよろしいですか？"
      end
    end
  end
end

