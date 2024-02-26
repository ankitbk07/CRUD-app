class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new

  end

  def show
  end 

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully destroyed."
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else 
      render :edit, status: unprocessable_entity
    end
  end 

  private
  # This is a much better practice than using a directly.
  def task_params
    params.require(:task).permit(:title)
  end
end
