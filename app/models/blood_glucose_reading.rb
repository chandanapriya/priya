class BloodGlucoseReading < ActiveRecord::Base
  belongs_to :patient
  before_save :set_created_at

  def set_created_at
    self.created_at ||= Date.today
  end
end
