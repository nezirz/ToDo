class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def show
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.create(task_params)
    @task.user_id=1
    if @task.save
      flash[:notice] = "Post successfully created"
      redirect_to tasks_path
    else
      render 'new'
    end
  end


  def edit
    @task=Task.find(params[:id])
  end

  def update
      @task=Task.find(params[:id])
      @task.user_id=1
      if @task.update_attributes(task_params)
        flash[:notice] = "Task successfully updated"
        redirect_to tasks_path
      else
        render 'edit'
      end
  end

  def destroy
  end

  private 
  def task_params
    params.require(:task).permit(:title,:active,:photo,:user_id)
  end
end
