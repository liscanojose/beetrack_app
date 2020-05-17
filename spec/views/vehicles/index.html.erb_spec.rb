require 'rails_helper'

RSpec.describe "vehicles/index", type: :view do
  before(:each) do
    assign(:vehicles, [
      Vehicle.create!(
        identifier: "Identifier",
        brand: "Brand"
      ),
      Vehicle.create!(
        identifier: "Identifier",
        brand: "Brand"
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    assert_select "tr>td", text: "Identifier".to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
  end
end
