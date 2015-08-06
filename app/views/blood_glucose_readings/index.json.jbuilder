json.array!(@blood_glucose_readings) do |blood_glucose_reading|
  json.extract! blood_glucose_reading, :id, :reading, :status, :patient_id
  json.url blood_glucose_reading_url(blood_glucose_reading, format: :json)
end
