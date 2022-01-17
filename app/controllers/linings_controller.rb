class LiningsController < ApplicationController
  before_action :set_lining, only: %i[ show edit update destroy ]

  # GET /linings or /linings.json
  def index
    @linings = Lining.all
  end

  # GET /linings/1 or /linings/1.json
  def show
  end

  # GET /linings/new
  def new
    @lining = Lining.new
  end

  # GET /linings/1/edit
  def edit
  end

  # POST /linings or /linings.json
  def create
    @lining = Lining.new(lining_params)

    respond_to do |format|
      if @lining.save
        format.html { redirect_to lining_url(@lining), notice: "Lining was successfully created." }
        format.json { render :show, status: :created, location: @lining }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lining.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linings/1 or /linings/1.json
  def update
    respond_to do |format|
      if @lining.update(lining_params)
        format.html { redirect_to lining_url(@lining), notice: "Lining was successfully updated." }
        format.json { render :show, status: :ok, location: @lining }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lining.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linings/1 or /linings/1.json
  def destroy
    @lining.destroy

    respond_to do |format|
      format.html { redirect_to linings_url, notice: "Lining was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lining
      @lining = Lining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lining_params
      params.require(:lining).permit(:name)
    end
end
