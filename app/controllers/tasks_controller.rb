class TasksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @list = @user.lists.first
    @tasks = Task.mine(@user)
    filtering_params(params).each do |key, value|
      if params[:by_list].present?
        @list = List.find(params[:by_list]) 
        @tasks = @list.tasks.mine(@user)
      end
      @tasks = @tasks.by_complete(params[:by_done]) if params[:by_done].present?
      @tasks = @tasks.by_doable(params[:by_type])  if params[:by_type].present?
    end
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

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(task_params)
        flash[:notice] = 'Task was successfully updated.'
        format.html {redirect_to user_task_path(current_user)}
        format.xml {head :ok}
        format.js {head :ok}
      else 
        format.html {render action: 'edit' }
        format.xml { render xml: @task.errors, status: :unprocessable_entity}
        format.js {head :unprocessable_entity}
      end
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
        task.lists << List.find(params[:id]) 
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
    params.require(:task).permit(:id, :user_id, :doable_id, :doable_type, :done, :notes, task_ids:[])
  end

  def filtering_params(params)
    params.slice(:by_type, :by_list, :by_done)
  end

end
