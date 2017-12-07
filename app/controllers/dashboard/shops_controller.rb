class Dashboard::ShopsController < BaseDashboardController
  before_action :load_shop, only: [:show, :edit, :update]
  before_action :load_params_update, only: :show
  before_action :check_user_status_for_action
  before_action :load_domain_in_session
  before_action :check_owner_or_manager, only: [:show, :edit]
  before_action :get_current_action, only: [:index, :show]
  @@current_action = nil

  def new
    @shop = current_user.own_shops.build
  end

  def create
    @shop = current_user.own_shops.build shop_params
    if @shop.save
      if check_domain_present?
        save_shop_domain
      else
        redirect_to dashboard_shops_path
      end
    else
      flash[:danger] = t "flash.danger.dashboard.updated_shop"
      render :new
    end
  end

  def show
    if params[:key_word].present? || params[:search_satus].present?
      case
      when params[:search_satus] == Settings.status_product.active
        @products = @shop.products.active.search(name_or_description_cont: params[:key_word]).result
      when params[:search_satus] == Settings.status_product.inactive
        @products = @shop.products.inactive.search(name_or_description_cont: params[:key_word]).result
      else
        @products = @shop.products.search(name_or_description_cont: params[:key_word]).result
      end
      @type_search = true
    else
      @shop = @shop.decorate
      @products = @shop.products.by_date_newest.page(params[:page])
        .per Settings.common.products_per_page
      @menus = @shop.menus.group_by {|menu| menu.kind}
      @products_all = @shop.products.all
      if @start_hour.present? and @end_hour.present?
        if compare_time_order @start_hour, @end_hour
          @products_all.update_all status: :active, start_hour: @start_hour,
            end_hour: @end_hour
          flash.now[:success] = t "dashboard.shops.show.update_success"
        else
          flash.now[:danger] = t "dashboard.shops.show.update_fail"
        end
      end
      @support = Supports::SearchSupport.new(@shop.id, "")
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def index
    @shop = Shop.new
    @request = @domain.request_shop_domains.build if @domain.present?
    @shops = current_user.shops.page(params[:page])
      .per Settings.common.products_per_page
  end

  def edit
  end

  def update
    shop_job = Delayed::Job.find_by id: @shop.delayjob_id
    shop_job.delete if shop_job.present?
    respond_to do |format|
      if params[:checked].present?
        if @shop.openforever
          update_on_off = false
        else
          update_on_off = true
          case
          when params[:checked] == Settings.checked_true
            @shop.update_attributes status_on_off: :on, delayjob_id: nil
          when params[:checked] == Settings.checked_false
            @shop.update_attributes status_on_off: :off, delayjob_id: nil
          end
        end
        shop_job = Delayed::Job.find_by id: @shop.delayjob_id
        time_close = shop_job.run_at.strftime(Settings.fomat_time_coutdown) if shop_job.present?
        format.js do
          render json: {time: time_close, type: update_on_off}
        end
      else
        format.html do
          if !params[:shop].present?
            redirect_to dashboard_shop_path
          else
            shop_job_id = @shop.delayjob_id
            if @shop.update_attributes shop_params
              flash[:success] = t "flash.success.dashboard.updated_shop"
            else
              flash[:danger] = t "flash.danger.dashboard.updated_shop"
            end
            if @@current_action == Settings.shop_actions.index
              redirect_to dashboard_shops_path
            else
              redirect_to dashboard_shop_path @shop
            end
          end
        end
      end
    end
  end

  private
  def shop_params
    if params[:shop][:openforever] == Settings.checkbox_value_true
      params.require(:shop).permit(:id, :name, :phone, :description, :cover_crop_x,
        :cover_crop_y, :cover_crop_w, :cover_crop_h, :crop_avatar_x, :crop_avatar_y,
        :crop_avatar_w, :crop_avatar_h,
        :cover_image, :avatar, :time_auto_reject, :time_auto_close, :openforever, :time_open, :time_close)
        .merge delayjob_id: nil
    else
      params.require(:shop).permit(:id, :name, :phone, :description, :cover_crop_x,
        :cover_crop_y, :cover_crop_w, :cover_crop_h,:crop_avatar_x, :crop_avatar_y,
        :crop_avatar_w, :crop_avatar_h,
        :cover_image, :avatar, :time_auto_reject, :time_auto_close, :openforever)
        .merge delayjob_id: nil
    end
  end

  def load_params_update
    @start_hour = params[:start_hour]
    @end_hour = params[:end_hour]
  end

  def load_shop
    if Shop.exists? params[:id]
      @shop = Shop.find params[:id]
    else
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to root_path
    end
  end

  def check_domain_present?
    @domain = Domain.find_by id: params[:shop][:domain_id]
    @domain.present?
  end

  def save_shop_domain
    shop_domain = if @domain.owner == current_user.id
      ShopDomain.new shop_id: @shop.id, domain_id: @domain.id,
        status: :approved
    else
      ShopDomain.new shop_id: @shop.id, domain_id: @domain.id,
        status: :pending
    end
    if shop_domain.save
      flash[:success] = t "flash.success.dashboard.updated_shop"
      check_status_notification shop_domain
      check_admin_accept_new_shop @shop
    else
      flash[:danger] = t "flash.danger.dashboard.updated_shop"
    end
    redirect_to dashboard_shops_path
  end

  def redirect_by_domain
    if check_domain_present?
      redirect_to dashboard_shop_path(@shop, domain_id: @domain.id)
    else
      redirect_to dashboard_shop_path(@shop, domain_id: session[:domain_id])
    end
  end

  def check_status_notification shop_domain
    if shop_domain.pending?
      shop_domain.create_event_request_shop @domain.owner, shop_domain
    elsif shop_domain.approved?
      shop_domain.create_event_request_shop shop_domain.shop.owner_id,
        shop_domain
    end
  end

  def check_admin_accept_new_shop shop
    if shop.pending?
      shop.create_event_request_shop shop.owner_id, shop
    end
  end

  def check_owner_or_manager
    shop_manager = ShopManager.find_by user_id: current_user.id, shop_id: @shop.id
    unless shop_manager.present? && (shop_manager.owner? || shop_manager.manager?)
      flash[:danger] = t "not_have_permission"
      redirect_to root_path
    end
  end

  def get_current_action
    @@current_action = params[:action]
  end
end
