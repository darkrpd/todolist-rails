class ItemsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :show, :destroy]

  def new
    @item = Item.new

  end

  def create
    @item = current_user.items.create(item_params)
    @item.update_attributes(category_id: @category.id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @category, notice: 'item was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @category, notice: 'item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_category
      @category = Category.friendly.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:content)
    end




end
