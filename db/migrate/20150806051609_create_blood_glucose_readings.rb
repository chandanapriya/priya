class CreateBloodGlucoseReadings < ActiveRecord::Migration
  def change
    create_table :blood_glucose_readings do |t|
      t.integer :reading
      t.string :status
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
