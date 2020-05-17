FactoryBot.define do
	factory :location do
		vehicle
		latitude { 20.23 }
		longitude { -0.56 }
		sent_at { "2016-06-02 20:45:00" }
		vehicle_identifier { "HA-3452" }
	end
end
