class AssignmentsController < ApplicationController
  
  def index
    @assignments = Assignment.all
    if params[:student_id].present?
      @assignments = Student.find(params[:student_id]).assignments
    else
      nil
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
    
  def create 
    @assignment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to students_path, notice: "You've created an assignment."
    else
      render action: 'new'
    end
  end
  
   def show
     @assignment = current_student.assignments.build(assignment_params)
  end

  
  private
    def assignment_params
      params.require(:assignment).permit(:name, :score, :total)
    end
end
