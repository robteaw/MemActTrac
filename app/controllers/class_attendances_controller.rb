class ClassAttendancesController < ApplicationController
  before_action :set_class_attendance, only: [:show, :edit, :update, :destroy]

  # GET /class_attendances
  # GET /class_attendances.json
  def index
    # This series of ifs allow the user to filter class attendance records
    # on the index page.
    # @class_attendances = ClassAttendance.paginate(:page => params[:page], per_page: 20)


    if params[:class_time]
      @class_attendances = ClassAttendance.where('class_time_id = ?', "#{params[:class_time]}"
      ).paginate(:page => params[:page], per_page: 20).order('id DESC')
    elsif params[:start_date]
      @class_attendances = ClassAttendance.where('date BETWEEN ? AND ?', "#{params[:start_date]}", "#{params[:end_date]}"
      ).paginate(:page => params[:page], per_page: 20).order('id DESC')
    else
      @class_attendances = ClassAttendance.paginate(page: params[:page], per_page: 20).order('id DESC')
    end

  end

  # GET /class_attendances/1
  # GET /class_attendances/1.json
  def show
  end

  # GET /class_attendances/new
  def new
    @today = get_day_of_week
    @todays_classes = ClassTime.where("day_of_week like ?", "%#{@today}").find_each
    @class_attendance = ClassAttendance.new
  end

  # GET /class_attendances/1/edit
  def edit
    # @todays_classes = ClassTime.where("day_of_week like ?", "%#{@today}").find_each
  end

  # POST /class_attendances
  # POST /class_attendances.json
  def create
    @class_attendance = ClassAttendance.new(class_attendance_params)

    respond_to do |format|
      if @class_attendance.save
        format.html { redirect_to @class_attendance, notice: 'Class attendance was successfully created.' }
        format.json { render :show, status: :created, location: @class_attendance }
      else
        format.html { render :new }
        format.json { render json: @class_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_attendances/1
  # PATCH/PUT /class_attendances/1.json
  def update
    respond_to do |format|
      if @class_attendance.update(class_attendance_params)
        format.html { redirect_to @class_attendance, notice: 'Class attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_attendance }
      else
        format.html { render :edit }
        format.json { render json: @class_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_attendances/1
  # DELETE /class_attendances/1.json
  def destroy
    @class_attendance.destroy
    respond_to do |format|
      format.html { redirect_to class_attendances_url, notice: 'Class attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_day_of_week
    today = ''
    d = Date.today
    case d.wday
    when 0
      today = 'Sunday'
    when 1
      today = 'Monday'
    when 2
      today = 'Tuesday'
    when 3
      today = 'Wednesday'
    when 4
      today = 'Thursday'
    when 5
      today = 'Friday'
    when 6
      today = 'Saturday'
    else
      print "Error finding day of week"
    end
  return today

  end
  #
  # def class_attendance_search(ct)
  #   @class_times = ClassTime.find(ct)
  #
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_attendance
      @class_attendance = ClassAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_attendance_params
      params.require(:class_attendance).permit(:class_time_id, :date, :attendance, :class_time, :start_date, :end_date)
    end
end
