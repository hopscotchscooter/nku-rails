class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  def index
    @attendances = Attendance.all
    
  end

  # GET /attendances/1
  def show
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
    @attendance = Attendance.new(attendance_params)
    @attendance.student_id = current_student.name
    @attendance.attended_on = Time.now.strftime("%m/%d/%Y")
    @attendance.seat_number = params[:attendance][:seat_number]
    if @attendance.save
      redirect_to attendances_path, notice: 'Attendance was successfully created.'
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
  
  def self.in_seat(seat, date)
    Student.joins(:attendances).where(attendances: {seat_number: seat, attended_on: date})
  end

  def self.absent(date)
   Student.joins(:attendances).where.not(attendances: {attended_on: date})
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
