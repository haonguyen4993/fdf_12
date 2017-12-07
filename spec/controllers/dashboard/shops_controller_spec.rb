require "rails_helper"

RSpec.describe Dashboard::ShopsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:domain) {FactoryGirl.create(:domain)}
  let!(:user_domain) {FactoryGirl.create(:user_domain, user: user, domain: domain)}
  let(:shop) {FactoryGirl.create(:shop, owner_id: user.id)}
  let!(:product) {FactoryGirl.create(:product, shop_id: shop.id, user_id: shop.owner_id)}
  let!(:menu) {FactoryGirl.create(:menu, shop_id: shop.id, user_id: shop.owner_id)}
  before {sign_in user}

  describe "#show" do
    before {get :show, id: shop}
    context "show shop" do
      it "assigns @shop" do
        expect(assigns(:shop)).to eq shop
      end
      it "assigns @products" do
        expect(assigns(:products)).to eq [product]
      end
      it "assigns @menus" do
        expect(assigns(:menus)).to eq [menu].group_by {|menu| menu.kind}
      end
      it "assigns @products_all" do
        expect(assigns(:products_all)).to eq [product]
      end
    end
  end
end
