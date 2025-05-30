class EventsController < ApplicationController
  before_action :set_event, only: [ :show ] # 誰でも見れる
  before_action :authenticate_user!, except: [ :index, :show ]  # ログイン済みユーザーのみアクセス可能
  before_action :set_own_event, only: [ :edit, :update, :destroy ]  # 所有者のみ操作可能

  def index
    # app/services/event_search_service.rbに詳しく検索用のロジックをまとめてある
    search_service = EventSearchService.new(params)
    @q = search_service.search
    # sanitize_page_paramで必ずparams[:page]の値が1以上になるように設定。
    page_number = sanitize_page_param(params[:page])
    @events = search_service.result.page(page_number)
  end

  def show
    @event = Event.find(params[:id])
    @clipboard_text = @event.formatted_text_for_clipboard
    # ログイン状態に応じて表示するコンポーネントを決定
    @todo_component = if user_signed_in?
                        Events::Todo::ListComponent.new(event: @event, current_user: current_user)
    else
                        Events::Todo::LoginPromptComponent.new
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice:  t("flash.events.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t("flash.events.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t("flash.events.deleted"), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_own_event
    @event = current_user.events.find_by(id: params[:id])

    unless @event
      redirect_to events_path, alert: "このイベントを編集する権限がありません。"
      nil
    end
  end

  def event_params
    params.require(:event).permit(:title, :event_date, :store_name, :location, :capacity, :party_fee, :party_type, :event_status, :visibility, :notes)
  end

  # ページ番号を安全にサニタイズ
  def sanitize_page_param(page_param)
    # page_paramが空白かチェック、空白なら1を代入してメソッド終了
    return 1 if page_param.blank?

    # page_paramの文字列を整数にしてpage_numberに代入
    page_number = page_param.to_i
    # page_numberが0以下なら1を代入する
    page_number > 0 ? page_number : 1
  end
end
