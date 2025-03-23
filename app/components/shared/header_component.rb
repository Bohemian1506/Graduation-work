# frozen_string_literal: true

class Shared::HeaderComponent < ViewComponent::Base
	def initialize(current_user: nil)
    @current_user = current_user
	end

  def logged_in?
    @current_user.present?
  end
end
