class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @rankings = @list.rankings.page(params[:page]).per(5)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id) , notice: 'List created'
    else
      render 'new'
    end
  end

  def addUser
    list = List.find(params[:id])
    current_user.lists << list
    redirect_to addListTask_path(list)
  end

  private 
  def list_params 
    params.require(:list).permit(:id,:name, :year, :creator, :ongoing,  user_ids: [], task_ids:[])
  end


end
