require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "validations" do
    subject { FactoryBot.create(:vehicle) }
    it { should validate_uniqueness_of(:identifier) }
  end
end
