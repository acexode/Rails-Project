class ProjectsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  def show
     @projects = Project.all
     
  end
  
  def single 
    @project = Project.find(params[:id])  
     
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

  def edit
    @project = Project.find(params[:id])  
  end

  def update
    @project = Project.find(params[:id])     
    @project.update(project_params)
    redirect_to '/dashboard'
  end

  def destroy    
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to '/dashboard'
  end
  private
    def project_params
      params.require(:project).permit(:content, :title, :img, :description)
    end
end
