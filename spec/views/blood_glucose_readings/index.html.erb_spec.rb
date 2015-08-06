require 'rails_helper'

RSpec.describe "blood_glucose_readings/index", :type => :view do
  before(:each) do
    assign(:blood_glucose_readings, [
      BloodGlucoseReading.create!(
        :reading => 1,
        :status => 2,
        :patient => nil
      ),
      BloodGlucoseReading.create!(
        :reading => 1,
        :status => 2,
        :patient => nil
      )
    ])
  end

  it "renders a list of blood_glucose_readings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
