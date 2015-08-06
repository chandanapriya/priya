require 'rails_helper'

RSpec.describe "blood_glucose_readings/edit", :type => :view do
  before(:each) do
    @blood_glucose_reading = assign(:blood_glucose_reading, BloodGlucoseReading.create!(
      :reading => 1,
      :status => 1,
      :patient => nil
    ))
  end

  it "renders the edit blood_glucose_reading form" do
    render

    assert_select "form[action=?][method=?]", blood_glucose_reading_path(@blood_glucose_reading), "post" do

      assert_select "input#blood_glucose_reading_reading[name=?]", "blood_glucose_reading[reading]"

      assert_select "input#blood_glucose_reading_status[name=?]", "blood_glucose_reading[status]"

      assert_select "input#blood_glucose_reading_patient_id[name=?]", "blood_glucose_reading[patient_id]"
    end
  end
end
