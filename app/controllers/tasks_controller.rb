class TasksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @list = @user.lists.first
    @tasks = Task.mine(@user).page(1).per(5)


    filtering_params(params).each do |key, value|
      if params[:by_list].present?
        @list = List.find(params[:by_list]) 
        @tasks = @list.tasks.mine(@user).page(1).per(5) 
      end
      @tasks = @tasks.by_complete(params[:by_done]).page(1).per(5) if params[:by_done].present?
      @tasks = @tasks.by_doable(params[:by_type]).page(1).per(5) if params[:by_type].present?
    end
  end

  def show
    @task = Task.find(params[:id])
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

  def edit 
    @task = Task.new
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

  def addListTask 
    @tasks = []
    ranks = List.find(params[:id]).rankings

    ranks.each do |rank|
      task =  Task.mine(current_user).find_by(doable_id: rank.doable_id, doable_type: rank.doable_type)
      if task.present?
      else
        task = current_user.tasks.new()
        task.doable_id = rank.doable_id
        task.doable_type = rank.doable_type
        @tasks << task
      end
        task.lists << List.find(params[:id]) 
    end

    if @tasks.each {|t| t.save}
      redirect_to(user_tasks_path(current_user), notice: 'List was successfully added')
    else
      render 'new'
    end
  end

  def complete
    if Task.where(id: params[:task_ids]).update_all(done: true)
      redirect_to :back, notice: "Update 'seen it'"
    else
      render 'index', notice: "NOT UPDATED"
    end
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
