require "rails_helper"

RSpec.describe Item, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:domain) {FactoryGirl.create(:domain)}
  let!(:user_domain) {FactoryGirl.create(:user_domain, user: user, domain: domain)}
  let(:shop) {FactoryGirl.create(:shop, owner_id: user.id)}
  let(:menu) {FactoryGirl.create(:menu, shop_id: shop.id, user_id: user.id)}
  let(:item) {FactoryGirl.create(:item, menu_id: menu.id)}
  subject {item}
  describe "init model" do
    context "relationship" do
      it {is_expected.to belong_to :menu}
    end
    context "validates" do
      it "valid name" do
        expect(subject).to be_valid
      end
      it "wrong format name" do
        subject.name = "ga@"
        expect(subject).to_not be_valid
      end
      it "too long name" do
        subject.name = "a" * 51
        expect(subject).to_not be_valid
      end
    end
  end
end
