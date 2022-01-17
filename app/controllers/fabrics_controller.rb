class FabricsController < ApplicationController
  before_action :set_fabric, only: %i[ show edit update destroy ]

  # GET /fabrics or /fabrics.json
  def index
    @fabrics = Fabric.all
  end

  # GET /fabrics/1 or /fabrics/1.json
  def show
  end

  # GET /fabrics/new
  def new
    @fabric = Fabric.new
  end

  # GET /fabrics/1/edit
  def edit
  end

  # POST /fabrics or /fabrics.json
  def create
    @fabric = Fabric.new(fabric_params)

    respond_to do |format|
      if @fabric.save
        format.html { redirect_to fabric_url(@fabric), notice: "Fabric was successfully created." }
        format.json { render :show, status: :created, location: @fabric }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fabrics/1 or /fabrics/1.json
  def update
    respond_to do |format|
      if @fabric.update(fabric_params)
        format.html { redirect_to fabric_url(@fabric), notice: "Fabric was successfully updated." }
        format.json { render :show, status: :ok, location: @fabric }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fabrics/1 or /fabrics/1.json
  def destroy
    @fabric.destroy

    respond_to do |format|
      format.html { redirect_to fabrics_url, notice: "Fabric was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fabric
      @fabric = Fabric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fabric_params
      params.require(:fabric).permit(:name)
    end
end
