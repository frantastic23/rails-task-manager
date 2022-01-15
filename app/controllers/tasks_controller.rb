class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]
  def index
    @tasks = Task.all
  end

  def show
    find_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    find_task
  end

  def update
    find_task
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    find_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
