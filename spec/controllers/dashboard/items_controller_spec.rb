require "rails_helper"

RSpec.describe Dashboard::ItemsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:domain) {FactoryGirl.create(:domain)}
  let!(:user_domain) {FactoryGirl.create(:user_domain, user: user, domain: domain)}
  let(:shop) {FactoryGirl.create(:shop, owner_id: user.id)}
  let(:menu) {FactoryGirl.create(:menu, shop_id: shop.id, user_id: shop.owner_id)}
  let(:item) {FactoryGirl.create(:item, menu_id: menu.id)}
  before {sign_in user}

  describe "#destroy" do
    context "destroy success" do
      before {delete :destroy, params: {shop_id: shop, menu_id: menu, id: item}, xhr: true}
      it "assigns @success" do
        expect(assigns(:success)).to eq true
      end
    end

    context "destroy fail" do
      before do
        allow_any_instance_of(Item).to receive(:destroy).and_return false
        delete :destroy, params: {shop_id: shop, menu_id: menu, id: item}, xhr: true
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq false
      end
    end
  end
  describe "#edit" do
    context "edit success" do
      before {get :edit, params: {shop_id: shop, menu_id: menu, id: item}, xhr: true}
      it "assigns @item" do
        expect(assigns(:item)).to eq item
      end
    end

    context "edit fail" do
      before do
        get :edit, params: {shop_id: shop, menu_id: menu, id: 5}, xhr: true
      end
      it "assigns @item" do
        expect(assigns(:item)).to eq nil
      end
    end
  end

  describe "#update" do
    context "update success" do
      before do
        post :update, params: {shop_id: shop, menu_id: menu, id: item, item:{name: "new name"}}, xhr: true
      end
      it "assigns @item" do
        expect(assigns(:item).name).to eq "new name"
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq true
      end
    end

    context "update fail" do
      before do
        post :update, params: {shop_id: shop, menu_id: menu, id: item, item:{name: ""}}, xhr: true
      end
      it "assigns @item" do
        expect(assigns(:item)).to eq item
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq false
      end
    end
  end

  describe "#new" do
    context "new success" do
      before {get :new, params: {shop_id: shop, menu_id: menu}, xhr: true}
      it "assigns @shop" do
        expect(assigns(:shop)).to eq Shop.shop_include_menus(shop.id).first
      end
      it "assigns @item_list" do
        expect(assigns(:item_list)) == nil
      end
      it "assigns @destroy_all" do
        expect(assigns(:destroy_all)).to eq nil
      end
    end

    context "new success within destroy_all params" do
      before do
        get :new, params: {shop_id: shop, menu_id: menu, destroy_all: true}, xhr: true
      end
      it "assigns @item_list" do
        expect(assigns(:item_list)).to eq [item]
      end
      it "assigns @destroy_all" do
        expect(assigns(:destroy_all)).to eq "true"
      end
      it "assigns @shop" do
        expect(assigns(:shop)).to eq Shop.shop_include_menus(shop.id).first
      end
    end

    context "new fail" do
      before do
        get :new, params: {shop_id: shop, menu_id: 999}, xhr: true
      end
      it "assigns @menu" do
        expect(assigns(:menu)).to eq nil
      end
    end
  end

  describe "#create" do
    context "create success" do
      before do
        item
        post :create, params: {shop_id: shop, menu_id: menu, item_list: "new name1\r\nnew name2\r\n"}, xhr: true
      end
      it "assigns @items" do
        expect(assigns(:items).map(&:name)).to eq ["new name1", "new name2"]
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq true
      end
      it "assigns @destroy_all" do
        expect(assigns(:destroy_all)).to eq nil
      end
      it "count item" do
        expect(Item.all.size).to eq 3
      end
    end

    context "create success within destroy all old items" do
      before do
        item
        post :create, params: {shop_id: shop, menu_id: menu, item_list: "new name1\r\nnew name2\r\n", destroy_all: true}, xhr: true
      end
      it "assigns @items" do
        expect(assigns(:items).map(&:name)).to eq ["new name1", "new name2"]
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq true
      end
      it "assigns @destroy_all" do
        expect(assigns(:destroy_all)).to eq "true"
      end
      it "count item" do
        expect(Item.all.size).to eq 2
      end
    end

    context "create fail" do
      before do
        post :create, params: {shop_id: shop, menu_id: menu, item_list: "new name1\r\n2new name\r\n"}, xhr: true
      end
      it "assigns @items" do
        expect(assigns(:items).map(&:name)).to eq ["new name1"]
      end
      it "assigns @success" do
        expect(assigns(:success)).to eq false
      end
      it "shop invalid" do
        post :create, params: {shop_id: 999, menu_id: menu,
          item:{name: "new name1\r\nnew name2\r\n"}}, xhr: true
        expect(assigns(:shop)).to eq nil
      end
    end
  end
end
