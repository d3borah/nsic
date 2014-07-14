class ProjectsController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in

  helper_method :sort_column, :sort_direction

  # GET /projects
  # GET /projects.json

  def index 
    list
    render('list')
  end

  def list
    #@projects = Project.sorted
  
  #if :sort_column == "projecttype"
  #  @projects = Project.by_udtids

  #elsif :sort_column == "numberofsamples"
   #   @projects = Project.order(self.sample.size + " " + sort_direction)
    
  #else
    @projects = Project.order(sort_column + " " + sort_direction)
  #end

    #@projects = Project.order
  end

  #def index
  #  @projects = Project.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @projects }
#    end
#  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    #@sample = Sample.find(params[:name], :include => :samples, :order => "sort_column + " " + sort_direction")
   #@project = Project.find(:all, :include => :samples).order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

private

def sort_column
  Project.column_names.include?(params[:sort]) ? params[:sort] : "name"
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

end
