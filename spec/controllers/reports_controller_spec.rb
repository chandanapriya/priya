require 'rails_helper'

RSpec.describe ReportsController, :type => :controller do

  describe "GET dailyReport" do
    it "returns http success" do
      get :dailyReport
      expect(response).to be_success
    end
  end

  describe "GET monthlyReport" do
    it "returns http success" do
      get :monthlyReport
      expect(response).to be_success
    end
  end

end
