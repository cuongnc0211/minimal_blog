class Admin::Custom::ProjectsController < Admin::BaseController
  def edit
    @project = Project.friendly.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to admin_project_path(@project)
    else
      flash.now[:error] = "Project could not be created"
      render :new
    end
  end

  def update
    @project = Project.friendly.find(params[:id])

    if @project.update(project_params)
      flash[:success] = "Project updated successfully"
      redirect_to admin_project_path(@project)
    else
      flash.now[:error] = "Project could not be updated"
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :team_size, :position, :url, :project_type)
  end
end