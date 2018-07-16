class Ads::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.order_posts.created_time_newer
      .page(params[:page]).per Settings.common.order_per_page
  end
end
