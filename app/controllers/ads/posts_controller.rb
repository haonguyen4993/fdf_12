class Ads::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, except: %i(index new create)
  before_action :change_current_feature, only: :index


  after_action :set_default_image!, only: :update

  def index
    @post_support = Supports::Ads::PostSupport.new nil, nil, params
    @domains = current_user.domains.except_id @domain.id
    @posts = @post_support.filtered_posts
    if params[:search_posts]
      @posts = @posts.search(title_or_content_cont: params[:search_posts]).result
    end
    if params[:filter] == Settings.filter.most_review
      @posts = @post_support.most_reviewed_post Settings.common.most_review_posts_per_page
      request.xhr? ? respond_to(:js) : render("most_review")
    end
  end

  def new
    @post_support = Supports::Ads::PostSupport.new Post.new
    @post_support.post.images.build
    if request.xhr?
      @post_support.children_categories = Category.by_parent params[:category_id]
      render json: {children_categories: @post_support.children_categories}
    end
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t "ads.post.flash.success"
      respond_to do |format|
        format.js{render locals: {redirect_url: domain_ads_posts_path(params[:domain_id])}}
      end
    else
      flash[:danger] = t "ads.post.flash.danger"
      respond_to do |format|
        format.js{render locals: {redirect_url: new_domain_ads_post_path}}
      end
    end
  end

  def show
    @post_support = Supports::Ads::PostSupport.new @post, current_user
    @review = @post.reviews.build
    @order_post = OrderPost.new
  end

  def edit
    @post_support = Supports::Ads::PostSupport.new @post
    @post_support.post.images.build if is_images_addable @post_support.post
    if request.xhr?
      @post_support.children_categories = Category.by_parent params[:category_id]
      render json: {
        children_categories: @post_support.children_categories,
        post_support: @post_support
      }
    end
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "ads.post.update.success"
      respond_to do |format|
        format.js {render :create,
          locals: {redirect_url: domain_ads_post_path(params[:domain_id], @post)}}
      end
    else
      flash[:danger] = t "ads.post.update.error"
      respond_to do |format|
        format.js {render :create,
          locals: {redirect_url: new_domain_ads_post_path}}
      end
    end
  end

  def destroy
    @post_id = @post.id
    @post.destroy
    @is_destroyed = @post.destroyed?

    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    if params[:post][:arena] == Domain.statuses.keys[1]
      params[:post].merge! domain_id: current_user.domain_default
    end
    params.require(:post).permit :title, :content, :category_id, :mode, :arena, :domain_id,
      :link_shop, :min_price, :max_price, images_attributes: [:id, :image, :_destroy]
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post.present? && (@post.approved? || current_user.posts.include?(@post))
    flash[:danger] = t "ads.post.error.not_found"
    redirect_to domain_ads_posts_path
  end

  def set_default_image!
    return unless @post.images.size.zero?
    image = Image.create! image: nil
    @post.update_attributes images_attributes: [{image: image}]
  end

  def is_images_addable post
    post.images.size < Settings.post.max_images &&
      post.images.first.image_url != PostImageUploader.default_url
  end

  def change_current_feature
    session["current_feature"] = domain_ads_posts_path if session["current_feature"] != domain_ads_posts_path
  end
end
