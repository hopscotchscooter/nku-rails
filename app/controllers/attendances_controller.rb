class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  def index
    if params[:student_id].present?
      @attendances = Student.find(params[:student_id]).attendances
    else
      @attendances = Attendance.all
    end
  end
  
  def search
    @attendance = Attendance.find_by_attended_on params[:search_date]
    render action: 'show'
  end
  
  # GET /attendances/1
  def show
    @attendances = Attendance.all.find(params[:id])
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  def create
    @attendance = current_student.attendances.build(attendance_params)
    @attendance.attended_on = Time.now.strftime("%Y-%m-%d")

    if @attendance.save
      redirect_to students_path, notice: "You've logged your attendance for the day."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /attendances/1
  def update
    if @attendance.update(attendance_params)
      redirect_to @attendance, notice: 'Attendance was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy
    redirect_to attendances_url, notice: 'Attendance was successfully destroyed.'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendance_params
      params.require(:attendance).permit(:attended_on, :seat_number)
    end
end
