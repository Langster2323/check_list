class TasksController < ApplicationController
  def index
    render locals: {
      tasks: Task.where(list_id: params[:list_id]),
      list: List.find(params[list_id])
    }
  end

  def show
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def new
    render locals: {
      task: Task.new,
      list: List.find(params[:id])
    }
  end

  def create
    task = Task.new(task_params)
    task.list_id = params[:list_id]
    if task.save
      redirect_to task_path(params[:list_id], task)
    else
      render :new
    end
  end

  def edit
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def updated
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to task
    else
      render :edit
    end
  end

  def destroy
    if Task.exists(params[:id])
      Task.destroy(params[:id])
      flash[:notice] = "Task deleted"
      redirect_to task
    else
      flash[:alert] = "Could not delete task."
    end
  end
end


private

def task_params
  params.require(:task).permit(:body)
end
