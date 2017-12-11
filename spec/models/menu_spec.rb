require "rails_helper"

RSpec.describe Menu, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:domain) {FactoryGirl.create(:domain)}
  let!(:user_domain) {FactoryGirl.create(:user_domain, user: user, domain: domain)}
  let(:shop) {FactoryGirl.create(:shop, owner_id: user.id)}
  let(:menu) {FactoryGirl.create(:menu, shop_id: shop.id, user_id: user.id)}
  subject {menu}
  describe "init model" do
    context "relationship" do
      it {is_expected.to have_many :menu_settings}
      it {is_expected.to have_many :items}
      it {is_expected.to belong_to :user}
      it {is_expected.to belong_to :shop}
    end
  end
end
