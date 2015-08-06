class AddCountToBloodGlucoseReadings < ActiveRecord::Migration
  def change
       add_column :blood_glucose_readings, :count, :integer
  end
end
