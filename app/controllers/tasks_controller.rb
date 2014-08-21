class TasksController < ApplicationController

  def index
    @task = Task.all
    @user = User.find(params[:user_id])
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
        task = current_user.tasks.new()
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

  def complete
    Task.where(id: params[:task_ids]).update_all(done: true)
    redirect_to :back, notice: "Update 'seen it'"
  end

  def delete
  end


  private 
  def task_params
    params.require(:task).permit(:id, :user_id, :doable_id, :doable_type, :done, :notes, :task_ids)
  end

end
