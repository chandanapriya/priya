require 'rails_helper'

RSpec.describe "BloodGlucoseReadings", :type => :request do
  describe "GET /blood_glucose_readings" do
    it "works! (now write some real specs)" do
      get blood_glucose_readings_path
      expect(response.status).to be(200)
    end
  end
end
