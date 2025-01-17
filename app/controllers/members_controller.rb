class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    # @members = Member.all
    # @members = Member.paginate(:page => params[:page], per_page: 20).order('id DESC')
    # @members = Member.search(params[:search]).paginate(:page => params[:page], :per_page => 20)

    if params[:first_name] and params[:last_name]
      if params[:last_name] == ""
        params[:last_name] = "          "
      end
      if params[:first_name] == ""
        params[:first_name] = "          "
      end
      @members = Member.where("fname LIKE ? OR lname LIKE ?", "%#{params[:first_name]}%", "%#{params[:last_name]}%")
                     .paginate(:page => params[:page], per_page: 20).order('id DESC')
    else
      @members = Member.paginate(:page => params[:page], per_page: 20).order('id DESC')
                     .paginate(:page => params[:page], per_page: 20).order('id DESC')
    end


  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @membership_types = MembershipType.where("id BETWEEN 1 AND 4 AND deleted_at IS NULL")
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:fname, :lname, :phone_number, :membership_type_id, :first_name, :last_name)
      # params.permit( :prospect_fname, :prospect_lname, :prospects_params => [:prospect_fname, :prospect_lname],
      #               :membership_types_params => [:membership_type_id, :membership_type])
    end
end
