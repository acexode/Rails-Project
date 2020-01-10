class ProjectsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  def show
     @projects = Project.all
     
  end

  def create      
    @project = current_user.projects.build(project_params)
  
    if @project.save      
      redirect_to '/'
    else
      flash[:errors] = @project.errors.full_messages      
      redirect_to '/projects/new'
    end
  end

  def update
  end

  def delete
  end
  private
    def project_params
      params.require(:project).permit(:content, :title, :img, :description)
    end
end
