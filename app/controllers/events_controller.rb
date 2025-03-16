class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]  # ログイン済みユーザーのみアクセス可能
  def index
    @events = Event.all
  end

  def show
    @clipboard_text = @event.formatted_text_for_clipboard
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: "イベントが正常に作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "イベントが正常に更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "イベントが正常に削除されました。", status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :event_date, :store_name, :location, :capacity, :party_fee, :party_type, :event_status, :visibility, :notes)
  end
end
