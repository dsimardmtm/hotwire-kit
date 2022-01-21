class KitsController < ApplicationController
  before_action :set_kit, only: %i[ show edit update destroy ]
  before_action :set_form_data, only: %i[ index new ]

  # GET /kits or /kits.json
  def index
    @kits = Kit.all
    @kits = @kits.search(params[:query]) if params[:query].present?
    # could also just filter by name with simply
    # @kits = @kits.where("name like ?", "%#{params[:query]}%") if params[:query].present?
    # and push only a turboframe view
    # see https://www.colby.so/posts/instant-search-with-rails-6-and-hotwire

    @pagy, @kits = pagy @kits.reorder(sort_column => sort_direction), items: params.fetch(:count, 5)
  end

  def sort_column
    %w{ name fabric_id lining_id button_id }.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
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
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("kit_form",
                                                    partial: "kits/form",
                                                    locals: { kit: @kit,
                                                              fabrics: items_with_prompt(Fabric.all, "Select a fabric"),
                                                              linings: items_with_prompt(Lining.all, "Select a lining"),
                                                              buttons: items_with_prompt(Button.all, "Select a button")}),
                 status: :unprocessable_entity
        }
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
    @fabrics = items_with_prompt(Fabric.all, "Select a fabric")
  end

  def define_options(target)
    case target
    when Fabric.to_s.downcase
      {
        items: items_with_prompt(Lining.all, "Select a lining"),
        target: "kit_#{Lining.to_s.downcase}_id",
        summary: "kit_#{Fabric.to_s.downcase}_summary"
      }
    when Lining.to_s.downcase
      {
        items: items_with_prompt(Button.all, "Select a button"),
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
