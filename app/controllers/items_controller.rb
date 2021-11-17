class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :get_list_shopping
  # GET /items or /items.json
  def index
    @items = @list_shopping.items
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @list_shopping.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = @list_shopping.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_shopping_items_path(@list_shopping), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to edit_list_shopping_item_path(@list_shopping), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_shopping_items_path(@list_shopping), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

    # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def get_list_shopping
    @list_shopping = ListShopping.find(params[:list_shopping_id])
  end

    # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:product, :amount)
  end
end
