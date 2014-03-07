class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /operators
  # GET /operators.json
  def index
    @operators = Operator.paginate(:per_page => 50, :page => params[:page])
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
    @wells = @operator.wells
    @leases = @operator.leases
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end

  # POST /operators
  # POST /operators.json
  def create
    @operator = Operator.new(operator_params)

    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Operator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @operator }
      else
        format.html { render action: 'new' }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'Operator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params[:operator]
    end

  # This method is set up to provide a default to the column sorting if the params hash is empty. From railscast 228.
  def sort_column
    if Operator.column_names.include?(params[:sort]) then
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
