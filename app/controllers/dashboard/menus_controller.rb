class Dashboard::MenusController < BaseDashboardController
  before_action :load_shop

  def index
    @menus = @shop.menus
  end

  private

  def load_shop
    @shop = Shop.find_by slug: params[:shop_id]
    unless @shop.present?
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to dashboard_shop_path
    end
  end
end
