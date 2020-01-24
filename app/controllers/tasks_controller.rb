class TasksController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tasks = Task.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @task = Task.new
    @task = current_user.tasks.build
  end

  def create
    @task = Task.create(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path
    else
      render action: :new
    end
  end

  def edit
    @task = Task.find(params[:id])
   
  end


  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render action: :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:name,:content,:image)
    end

  def move_to_index
    redirect_to controller: 'users', action: 'index' unless user_signed_in?
  end

end
