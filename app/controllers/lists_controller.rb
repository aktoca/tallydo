class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.find(params[:id])
    @user
  end

  def addUser
    list = List.find(params[:id])
    current_user.lists << list
    redirect_to addList_path(list)
  end

  private 
  def list_params 
    params.require(:list).permit(:id,:name, :year, :creator, :ongoing,  user_ids: [], task_ids:[])
  end


end
