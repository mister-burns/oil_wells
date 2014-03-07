class WellsController < ApplicationController
  before_action :set_well, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /wells
  # GET /wells.json
  def index
    @wells = Well.order(sort_column + " " + sort_direction + " NULLS LAST").paginate(:per_page => 50, :page => params[:page])
  end

  # GET /wells/1
  # GET /wells/1.json
  def show
  end

  # GET /wells/new
  def new
    @well = Well.new
  end

  # GET /wells/1/edit
  def edit
  end

  # POST /wells
  # POST /wells.json
  def create
    @well = Well.new(well_params)

    respond_to do |format|
      if @well.save
        format.html { redirect_to @well, notice: 'Well was successfully created.' }
        format.json { render action: 'show', status: :created, location: @well }
      else
        format.html { render action: 'new' }
        format.json { render json: @well.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wells/1
  # PATCH/PUT /wells/1.json
  def update
    respond_to do |format|
      if @well.update(well_params)
        format.html { redirect_to @well, notice: 'Well was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @well.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wells/1
  # DELETE /wells/1.json
  def destroy
    @well.destroy
    respond_to do |format|
      format.html { redirect_to wells_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_well
      @well = Well.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def well_params
      params.require(:well).permit(:tracking_number, :api_number, :operator_name)
    end

  # This method is set up to provide a default to the column sorting if the params hash is empty. From railscast 228.
  def sort_column
    if Well.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "submit_date"
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
