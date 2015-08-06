require "rails_helper"

RSpec.describe BloodGlucoseReadingsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blood_glucose_readings").to route_to("blood_glucose_readings#index")
    end

    it "routes to #new" do
      expect(:get => "/blood_glucose_readings/new").to route_to("blood_glucose_readings#new")
    end

    it "routes to #show" do
      expect(:get => "/blood_glucose_readings/1").to route_to("blood_glucose_readings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blood_glucose_readings/1/edit").to route_to("blood_glucose_readings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blood_glucose_readings").to route_to("blood_glucose_readings#create")
    end

    it "routes to #update" do
      expect(:put => "/blood_glucose_readings/1").to route_to("blood_glucose_readings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blood_glucose_readings/1").to route_to("blood_glucose_readings#destroy", :id => "1")
    end

  end
end
