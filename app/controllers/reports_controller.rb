class ReportsController < ApplicationController

  def dailyReport
    @line_patients =BloodGlucoseReading.select("created_at as date, count(case status  when 'max'then 1 else null end)as max
,count(case status when 'avg'then 1 else null end)as aveg, count(case status when 'min'then 1 else null end)as min").group("created_at")

  end

  def monthlyReport
    @line_patients =BloodGlucoseReading.select("DATE_FORMAT(created_at, '%Y%m') as month, count(case status  when 'max'then 1 else null end)as max
,count(case status when 'avg'then 1 else null end)as aveg, count(case status when 'min'then 1 else null end)as min").group("Month(created_at)")

  end
end
