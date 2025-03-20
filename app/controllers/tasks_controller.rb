class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_task, only: %i[ edit update destroy ]
  

  

  # index・showアクションはいらない（今回taskはeventのviewファイル内でひょうじするため）
  

  def new
    @task = @event.tasks.new
  end

  def edit
  end

  def create
    @task = @event.tasks.new(task_params)

    if @task.save
      # モデルメソッドを使って担当者を設定
      @task.assign_users(params[:task][:user_ids])
      redirect_to @event, notice: t('flash.tasks.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      # モデルメソッドを使って担当者を設定
      @task.assign_users(params[:task][:user_ids])
      redirect_to @event, notice: t('flash.tasks.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to @event, notice: t('flash.tasks.deleted'), status: :see_other
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_task
      @task = @event.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :task_status, :due_date)
    end
end
