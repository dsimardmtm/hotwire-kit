class KitsController < ApplicationController
  before_action :set_kit, only: %i[ show edit update destroy ]
  before_action :set_form_data, only: %i[ index new ]

  # GET /kits or /kits.json
  def index
    @kits = Kit.all
  end

  # GET /kits/1 or /kits/1.json
  def show
  end

  # GET /kits/new
  def new
  end

  # GET /kits/1/edit
  def edit
  end

  # POST /kits or /kits.json
  def create
    @kit = Kit.new(kit_params)

    respond_to do |format|
      if @kit.save
        format.html { redirect_to kits_url, notice: "Kit was successfully created." }
        format.json { render :show, status: :created, location: @kit }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("kit_form", partial: "kits/form", locals: { kit: @kit, fabrics: Fabric.all }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kits/1 or /kits/1.json
  def update
    respond_to do |format|
      if @kit.update(kit_params)
        format.html { redirect_to kit_url(@kit), notice: "Kit was successfully updated." }
        format.json { render :show, status: :ok, location: @kit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kits/1 or /kits/1.json
  def destroy
    @kit.destroy

    respond_to do |format|
      format.html { redirect_to kits_url, notice: "Kit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def kit_options
    target = params[:target]
    options = define_options(target)

    @options_for_select = options[:items] if options[:items]
    @id = options[:target]
    @summary_target = options[:summary]
    @value = params[:selected_value]

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_kit
    @kit = Kit.find(params[:id])
  end

  def set_form_data
    @kit = Kit.new
    @fabrics = Fabric.all
    @linings = Lining.all
    @buttons = Button.all
  end

  def define_options(target)
    case target
    when Fabric.to_s.downcase
      {
        items: items_with_prompt(Lining.all, "Select a Lining"),
        target: "kit_#{Lining.to_s.downcase}_id",
        summary: "kit_#{Fabric.to_s.downcase}_summary"
      }
    when Lining.to_s.downcase
      {
        items: items_with_prompt(Button.all, "Select a Button"),
        target: "kit_#{Button.to_s.downcase}_id",
        summary: "kit_#{Lining.to_s.downcase}_summary"
      }
    when Button.to_s.downcase
      {
        items: nil,
        target: nil,
        summary: "kit_#{Button.to_s.downcase}_summary"
      }
    else
      raise Argument_error
    end
  end

  def items_with_prompt(items, prompt)
    items
      .collect { |option| [option.name, option.id] }
      .unshift([prompt, "0"])
  end

  # Only allow a list of trusted parameters through.
  def kit_params
    params.require(:kit).permit(:button_id, :fabric_id, :lining_id, :name)
  end
end
