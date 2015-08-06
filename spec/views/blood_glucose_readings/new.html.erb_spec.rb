require 'rails_helper'

RSpec.describe "blood_glucose_readings/new", :type => :view do
  before(:each) do
    assign(:blood_glucose_reading, BloodGlucoseReading.new(
      :reading => 1,
      :status => 1,
      :patient => nil
    ))
  end

  it "renders new blood_glucose_reading form" do
    render

    assert_select "form[action=?][method=?]", blood_glucose_readings_path, "post" do

      assert_select "input#blood_glucose_reading_reading[name=?]", "blood_glucose_reading[reading]"

      assert_select "input#blood_glucose_reading_status[name=?]", "blood_glucose_reading[status]"

      assert_select "input#blood_glucose_reading_patient_id[name=?]", "blood_glucose_reading[patient_id]"
    end
  end
end
