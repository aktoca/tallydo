class TasksController < ApplicationController
  def create
  end

  def new
  end

def update
  redirect_to :back, notice: "Update 'seen it'"
end

  def delete
  end

  def index
      @user = User.find(params[:user_id])
      @me = current_user
  end
end
