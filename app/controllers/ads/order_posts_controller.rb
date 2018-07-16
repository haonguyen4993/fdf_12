class Ads::OrderPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: [:index]
  before_action :load_order_post, only: [:destroy]

  def index
    @orders = @post.order_posts
  end

  def create
    @order_post = OrderPost.new order_post_params
    if @order_post.save
      flash[:success] = t "flash.success.create_order"
      redirect_to ads_post_orders_path
    else
      render :back
    end
  end

  def destroy
    if @order.destroy
      flash[:success] = t "oder.deleted"
    else
      flash[:danger] = t "oder.not_delete"
    end
    redirect_to ads_post_orders_path
  end

  private
  def order_post_params
    params.require(:order_post).permit :quantity, :notes, :user_id, :post_id
  end

  def load_order_post
    @order = OrderPost.find_by id: params[:id]
    return if @order
    flash[:danger] = t "flash.danger.load_order"
    redirect_to dashboard_ads_posts_path
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    return if @post
    flash[:danger] = t "ads.post.error.not_found"
    redirect_to dashboard_ads_posts_path
  end
end
