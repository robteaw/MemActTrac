class MembershipTypesController < ApplicationController
  before_action :set_membership_type, only: [:show, :edit, :update, :destroy]

  # GET /membership_types
  # GET /membership_types.json
  def index
    @membership_types = MembershipType.where("deleted_at IS NULL")
    @deleted_types = MembershipType.where("deleted_at IS NOT NULL")
  end

  # GET /membership_types/1
  # GET /membership_types/1.json
  def show
  end

  # GET /membership_types/new
  def new
    @membership_type = MembershipType.new
  end

  # GET /membership_types/1/edit
  def edit
  end

  # POST /membership_types
  # POST /membership_types.json
  def create
    @membership_type = MembershipType.new(membership_type_params)

    respond_to do |format|
      if @membership_type.save
        format.html { redirect_to @membership_type, notice: 'Membership type was successfully created.' }
        format.json { render :show, status: :created, location: @membership_type }
      else
        format.html { render :new }
        format.json { render json: @membership_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_types/1
  # PATCH/PUT /membership_types/1.json
  def update
    respond_to do |format|
      if @membership_type.update(membership_type_params)
        format.html { redirect_to @membership_type, notice: 'Membership type was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership_type }
      else
        format.html { render :edit }
        format.json { render json: @membership_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_types/1
  # DELETE /membership_types/1.json
  def destroy
    @membership_type.soft_delete
    respond_to do |format|
      format.html { redirect_to membership_types_url, notice: 'Soft delete performed on Membership Type.' }
      format.json { head :no_content }
    end
  end

  def reactivate
    @membership_type = MembershipType.find(params[:id])
    @membership_type.reactivate
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_type
      @membership_type = MembershipType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_type_params
      params.require(:membership_type).permit(:membership_type)
    end
end
