class CallsController < ApplicationController
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index
    # @calls = Call.paginate(:page => params[:page], per_page: 20)


    if params[:filter] == "All Calls"
      @calls = Call.paginate(:page => params[:page], per_page: 20)
      @view_type = "All "
    elsif params[:filter] == "Past Due"
      @calls = Call.where("due_date < ? AND completed IS NULL", "#{Date.today}").paginate(:page => params[:page], per_page: 20)
      @view_type = "Past Due "
    else
      @calls = Call.where("due_date > ? AND completed IS NULL", "#{Date.today}").paginate(:page => params[:page], per_page: 20)
      @view_type = "Upcoming "
    end
  end

  def record_calls
    @call = Call.find(params[:id])
    @call.record_call(params[:employee_id], params[:outcome])
    redirect_to request.referrer, notice: "Call recorded"
  end


  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:member_id, :employee_id, :outcome, :due_date, :completed, :filter)
    end
end
