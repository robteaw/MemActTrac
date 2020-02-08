class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  # GET /prospects
  # GET /prospects.json
  def index
    # @prospects = Prospect.all
    @prospects = Prospect.paginate(:page => params[:page], per_page: 20).order('id DESC')
    @mst = MembershipType.all
    @members = Member.all
    @no_shows = Prospect.where(showed: :false).paginate(:page => params[:page], per_page: 20)
  end

  # GET /prospects/1
  # GET /prospects/1.json
  def show
  end

  # GET /prospects/new
  def new
    @prospect = Prospect.new
  end

  # GET /prospects/1/edit
  def edit
  end

  # POST /prospects
  # POST /prospects.json
  def create
    @prospect = Prospect.new(prospect_params)

    respond_to do |format|
      if @prospect.save
        format.html { redirect_to @prospect, notice: 'Prospect was successfully created.' }
        format.json { render :show, status: :created, location: @prospect }
      else
        format.html { render :new }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prospects/1
  # PATCH/PUT /prospects/1.json
  def update
    respond_to do |format|
      if @prospect.update(prospect_params)
        format.html { redirect_to @prospect, notice: 'Prospect was successfully updated.' }
        format.json { render :show, status: :ok, location: @prospect }
      else
        format.html { render :edit }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospects/1
  # DELETE /prospects/1.json
  def destroy
    @prospect.destroy
    respond_to do |format|
      format.html { redirect_to prospects_url, notice: 'Prospect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def convert_to_member
  #   @prospect = Prospect.find(params[:id])
  #   mst = MembershipType.find(params[:membership_type_id])
  #   @prospect.convert_to_member(params[:phone_number], mst.id)
  # end

  def did_show
    #functionality for easy marking of prospect attendance
    @prospect = Prospect.find(params[:id])
    @prospect.did_show
    redirect_to request.referrer, notice: "Prospect recorded as came to class"
  end

  def find_no_shows
    #find prospects who did not come to their scheduled class
    @no_shows = Prospect.where(showed: :false).paginate(:page => params[:page], per_page: 20).order('id DESC')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def prospect_params
      params.require(:prospect).permit(:fname, :lname, :showed, :signed_up, :scheduled_date, :membership_type_id,
                                       :class_time_id, :phone_number, :full_membership_type,
                                       :prospects_attributes => [:fname, :lname])
      # params.permit(:phone_number, :full_membership_type, :prospect_fname, :prospect_lname)
    end
end
