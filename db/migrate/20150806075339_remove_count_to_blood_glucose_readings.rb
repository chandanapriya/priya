class RemoveCountToBloodGlucoseReadings < ActiveRecord::Migration
  def change
    remove_column :blood_glucose_readings, :count, :integer
  end
end
