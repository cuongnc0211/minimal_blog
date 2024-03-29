class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(start_date: :desc)
  end

  def show
    @project = Project.find(params[:id])
  end
end
