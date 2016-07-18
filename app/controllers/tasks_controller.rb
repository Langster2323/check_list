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
      redirect_to_list_task_path(params[:list_id], task)
    else
      render :new
    end
  end
end
