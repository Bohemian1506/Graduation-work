require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Devise を使用している場合

  setup do
    @event = events(:one)
    @task = tasks(:one)
    # ログインが必要な場合
    sign_in users(:one) if defined?(sign_in)
  end

  test "should get new" do
    get new_event_task_url(@event)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post event_tasks_url(@event), params: { 
        task: { 
          description: @task.description, 
          due_date: @task.due_date, 
          task_status: @task.task_status, 
          title: "New Test Task" 
        } 
      }
    end

    assert_redirected_to event_url(@event)  # リダイレクト先を確認
  end

  test "should get edit" do
    get edit_event_task_url(@event, @task)
    assert_response :success
  end

  test "should update task" do
    patch event_task_url(@event, @task), params: { 
      task: { 
        description: @task.description, 
        due_date: @task.due_date, 
        task_status: @task.task_status, 
        title: @task.title 
      } 
    }
    assert_redirected_to event_url(@event)  # リダイレクト先を確認
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete event_task_url(@event, @task)
    end

    assert_redirected_to event_url(@event)  # リダイレクト先を確認
  end
end