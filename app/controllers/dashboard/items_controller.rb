class Dashboard::ItemsController < BaseDashboardController
  before_action :load_shop
  before_action :load_menu
  before_action :load_item

  def destroy
    @success = false
    if @item.destroy
      @success = true
    end
  end

  private

  def load_shop
    @shop = Shop.find_by slug: params[:shop_id]
    unless @item
      render :destroy
    end
  end

  def load_menu
    @menu = @shop.menus.find_by id: params[:menu_id]
    unless @item
      render :destroy
    end
  end

  def load_item
    @item = @menu.items.find_by id: params[:id]
    unless @item
      render :destroy
    end
  end
end
