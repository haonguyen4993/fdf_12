require "rails_helper"

RSpec.describe MenuSetting, type: :model do
  let(:menu_setting) {FactoryGirl.create(:menu_setting)}
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
