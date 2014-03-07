class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.paginate(:per_page => 50, :page => params[:page])
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
    @wells = @lease.wells
    @operators = @lease.operators
  end

  # GET /leases/new
  def new
    @lease = Lease.new
  end

  # GET /leases/1/edit
  def edit
  end

  # POST /leases
  # POST /leases.json
  def create
    @lease = Lease.new(lease_params)

    respond_to do |format|
      if @lease.save
        format.html { redirect_to @lease, notice: 'Lease was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lease }
      else
        format.html { render action: 'new' }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    respond_to do |format|
      if @lease.update(lease_params)
        format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lease_params
      params[:lease]
    end

  # This method is set up to provide a default to the column sorting if the params hash is empty. From railscast 228.
  def sort_column
    if Lease.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "name"
    end
  end

  # This method is set up to provide a default to the column sorting if the params hash is empty. From railscast 228.
  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "desc"
    end
  end

end
