class EventsController < ApplicationController
  before_action :set_event, only: [ :show ] # 誰でも見れる
  before_action :authenticate_user!, except: [ :index, :show ]  # ログイン済みユーザーのみアクセス可能
  before_action :set_own_event, only: [ :edit, :update, :destroy ]  # 所有者のみ操作可能
  def index
    @q = Event.ransack(params[:q])

      # 検索パラメータが存在する場合、複数フィールドに条件を適用
      if params[:q] && params[:q][:title_cont].present?
        keyword = params[:q][:title_cont]

        # 複数のフィールドをORで検索するための条件を構築
        @q = Event.ransack(
          title_cont: keyword,
          store_name_cont: keyword,
          location_cont: keyword,
          notes_cont: keyword,
          m: "or"  # 'm: "or"'は条件をORで結合することを指定
        )
      end

    @events = @q.result(distinct: true)
  end

  def show
    @event = Event.find(params[:id])
    @clipboard_text = @event.formatted_text_for_clipboard
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
end
