# クラス定義の外側でrequireを試みる
begin
  require "ransack/helpers/form_helper"
rescue LoadError
  # モジュールが見つからない場合は何もしない
end

class Shared::HeaderComponent < ViewComponent::Base
  # モジュールが定義されているかチェックしてからインクルード
  if defined?(Ransack::Helpers::FormHelper)
    include Ransack::Helpers::FormHelper
  end

  def initialize(current_user: nil, q: nil)
    @current_user = current_user
    @q = q
  end

  def logged_in?
    @current_user.present?
  end
end
