class TasksController < ApplicationController
  before_action :login_first
  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash.notice = "#{@task.name}を登録しました"
      redirect_to @task
    else
      render :new
    end
  end

  def index
    @tasks = current_user.tasks.recent
  end

  def show
    @task = current_user.tasks.find_by(id: params[:id])
  end

  def edit
    @task = current_user.tasks.find_by(id: params[:id])
  end

  def update
    @task = current_user.tasks.find_by(id: params[:id])
    if @task.update(task_params)
      flash.now[:notice] = "#{@task.name}を編集しました"
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :user_id)
  end
end
