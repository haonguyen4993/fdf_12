require "rails_helper"

RSpec.describe MenuSetting, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:domain) {FactoryGirl.create(:domain)}
  let!(:user_domain) {FactoryGirl.create(:user_domain, user: user, domain: domain)}
  let(:shop) {FactoryGirl.create(:shop, owner_id: user.id)}
  let(:menu) {FactoryGirl.create(:menu, shop_id: shop.id, user_id: user.id)}
  let(:menu_setting) {FactoryGirl.create(:menu_setting, menu_id: menu.id)}
  subject {menu_setting}
  context "relationship" do
    it {is_expected.to belong_to :menu}
  end
  context "validates" do
    it "valid params" do
      expect(subject).to be_valid
    end
    it "wrong format price" do
      subject.price = "a"
      expect(subject).to_not be_valid
    end
    it "wrong maximum" do
      subject.maximum = 11
      expect(subject).to_not be_valid
    end
    it "wrong coeficient" do
      subject.coeficient = -1
      expect(subject).to_not be_valid
    end
  end
end
