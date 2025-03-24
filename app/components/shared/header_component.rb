# frozen_string_literal: true

class Shared::HeaderComponent < ViewComponent::Base
  include Ransack::Helpers::FormHelper
  def initialize(current_user: nil, q: nil)
    @current_user = current_user
    @q = q
  end

  def logged_in?
    @current_user.present?
  end
end
