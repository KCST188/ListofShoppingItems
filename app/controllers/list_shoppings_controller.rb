class ListShoppingsController < ApplicationController
  before_action :set_list_shopping, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]
  # GET /list_shoppings or /list_shoppings.json
  def index
    @list_shoppings = ListShopping.all
  end

  # GET /list_shoppings/1 or /list_shoppings/1.json
  def show
  end

  # GET /list_shoppings/new
  def new

    @list_shopping = current_user.list_shoppings.build
  end

  # GET /list_shoppings/1/edit
  def edit
  end

  # POST /list_shoppings or /list_shoppings.json
  def create
    @list_shopping = current_user.list_shoppings.build(list_shopping_params)

    respond_to do |format|
      if @list_shopping.save
        format.html { redirect_to @list_shopping, notice: "List shopping was successfully created." }
        format.json { render :show, status: :created, location: @list_shopping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_shoppings/1 or /list_shoppings/1.json
  def update
    respond_to do |format|
      if @list_shopping.update(list_shopping_params)
        format.html { redirect_to @list_shopping, notice: "List shopping was successfully updated." }
        format.json { render :show, status: :ok, location: @list_shopping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_shoppings/1 or /list_shoppings/1.json
  def destroy
    @list_shopping.destroy
    respond_to do |format|
      format.html { redirect_to list_shoppings_url, notice: "Shopping List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @list_shopping = current_user.list_shoppings.find_by(id: params[:id])
    redirect_to list_shoppings_path, notice: "Not autorized to edit this list" if @list_shopping.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_shopping
      @list_shopping = ListShopping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_shopping_params
      params.require(:list_shopping).permit(:name, :user_id)
    end
end
