class ProjectsController < ApplicationController
  def index
    @professional_projects = Project.professional_projects.order(start_date: :desc)
    @side_projects = Project.side_projects.order(start_date: :desc)
  end

  def show
    @project = Project.find(params[:id])
  end
end
