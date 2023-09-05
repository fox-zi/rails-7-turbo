class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_company.tasks.order(created_at: :desc)
  end

  def new
    @task = current_company.tasks.new
  end

  def create
    @task = current_company.tasks.new(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_task
    @task = current_company.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
