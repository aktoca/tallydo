class TasksController < ApplicationController

  def index

    @task = Task.all
    @user = current_user
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to(new_session_path, notice: 'Task was successfully created')
    else
      render 'new'
    end

  end

  def addList 
    @tasks = []
    ranks = List.find(params[:id]).rankings

    ranks.each do |rank|
      if Task.find_by(doable_id: rank.doable_id, doable_type: rank.doable_type)
        task = Task.new()
        task.user_id = current_user.id
        task.doable_id = rank.doable_id
        task.doable_type = rank.doable_type
        @tasks << task
      end
    end

    if @tasks.each {|t| t.save}
      redirect_to(user_tasks_path(current_user), notice: 'List was successfully added')
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end
  def update 
    redirect_to :back, notice: "Update 'seen it'"
    Task.where(id: params[:task_ids]).update_all(done: true)
  end

  def delete
  end


  private 
  def task_params
    params.require(:task).permit(:id, :user_id, :doable_id, :doable_type, :done, :notes)
  end

end
