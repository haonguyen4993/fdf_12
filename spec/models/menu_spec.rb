require "rails_helper"

RSpec.describe Menu, type: :model do
  let(:menu) {FactoryGirl.create(:menu)}
  subject {menu}
  describe "init model" do
    context "relationship" do
      it {is_expected.to have_many :menu_settings}
      it {is_expected.to belong_to :user}
      it {is_expected.to belong_to :shop}
    end
    context "validates" do
      it "valid item" do
        expect(subject).to be_valid
      end
      it "wrong format item" do
        subject.item = ["ga@", "thit"]
        expect(subject).to_not be_valid
      end
      it "too long item" do
        subject.item = ["a" * 51, "thit"]
        expect(subject).to_not be_valid
      end
    end
  end
end
