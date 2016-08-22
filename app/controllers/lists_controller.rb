class ListsController < ApplicationController
  def index
    render locals: {
      lists: List.all
    }
  end

  def show
    render locals: {
      list: List.find(params[:id])
    }
  end
end
