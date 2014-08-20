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
    current_user.lists << List.find(params[:id])
    redirect_back_or_to(user_path(current_user) , notice: 'Added List successful')
  end

  private 
  def list_params 
    params.require(:list).permit(:id,:name, :year, :creator, :ongoing,  user_ids: [])
  end


end
