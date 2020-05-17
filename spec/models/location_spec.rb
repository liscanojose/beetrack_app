require 'rails_helper'

RSpec.describe Location, type: :model do
  include Shoulda::Matchers::ActiveRecord

  describe "Relationship location" do
    subject { FactoryBot.create(:location) }
      it { should belong_to(:vehicle) }
  end

  describe "validations" do
    subject { FactoryBot.create(:location) }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :sent_at }
    it { should validate_presence_of :vehicle_identifier }
  end

  describe "long_and_lat" do
    subject(:location) { FactoryBot.create(:location) }
    it "long_and_lat" do
      expect(location.long_and_lat).to eq([location.latitude,location.longitude,location.vehicle_identifier])
    end
  end

end
