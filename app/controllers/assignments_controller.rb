class AssignmentsController < ApplicationController
  def index
    if params[:student_id].present?
      @assignments = Student.find(params[:student_id]).assignments
    else
      @assignments = Assignment.all
     end
  end
  
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to assignments_url, notice: 'Assignment was successfully destroyed.'
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def show
    @assignments = current_student.assignments.find(params[:id])
  end
  
  def create 
    @assignment = Assignment.create!(assignment_params)
     
    if @assignment.save
      redirect_to root_path, notice: "You've created an assignment."
    else
      render action: 'new'
    end
  end
  

  
  private
    def assignment_params
      params.require(:assignment).permit(:name, :score, :total)
    end
end
