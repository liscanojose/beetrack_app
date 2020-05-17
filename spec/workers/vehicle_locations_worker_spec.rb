require 'rails_helper' # include in your RSpec file

RSpec.describe VehicleLocationsWorker, type: :worker do
  describe 'perform' do
    subject(:location) { FactoryBot.create(:location) }
    it 'VehicleLocationsWorker jobs are enqueued in the default queue' do
      described_class.perform_async
      assert_equal "default", described_class.queue
    end
    it 'goes into the jobs array for testing environment' do
      expect do
        described_class.perform_async
      end.to change(described_class.jobs, :size).by(1)
      described_class.perform_in(1.second, location)
    end
    context 'occurs in request' do
      let(:location) { FactoryBot.create(:location) }
      it 'occurs at GPS waypoints' do
        vehicle = location.vehicle
        described_class.perform_in(1.second, location)
        expect(Location.last).to eq(location)
        expect(Location.last.vehicle).to eq(vehicle)
      end
    end
  end
end
