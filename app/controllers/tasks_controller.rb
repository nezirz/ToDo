class TasksController < ApplicationController
  def index
    if user_signed_in?
      @tasks=Task.where({created_by:current_user.id,active:true}).order(event_time: :asc)
    else
      @tasks=Task.where({active:true})
    end
  end

  def show
      @task = Task.find(params[:id])
      @createdby=User.find(@task.created_by)

  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.create(task_params)
    @task.created_by=current_user.id
    
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
    
      if @task.update_attributes(task_params)
        flash[:notice] = "Task successfully updated"
        redirect_to tasks_path
      else
        render 'edit'
      end
  end

  def destroy
  @task =Task.find(params[:id])
  @task.destroy

  redirect_to tasks_path
  end

  private 
  def task_params
    params.require(:task).permit(:title,:active,:photo,:user_id,:event_time,:created_by)
  end
end
