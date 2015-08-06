require 'rails_helper'

RSpec.describe "blood_glucose_readings/show", :type => :view do
  before(:each) do
    @blood_glucose_reading = assign(:blood_glucose_reading, BloodGlucoseReading.create!(
      :reading => 1,
      :status => 2,
      :patient => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
