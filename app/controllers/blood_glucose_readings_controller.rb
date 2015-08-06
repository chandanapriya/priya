class BloodGlucoseReadingsController < ApplicationController
  before_action :set_blood_glucose_reading, only: [:show, :edit, :update, :destroy]

  # GET /blood_glucose_readings
  # GET /blood_glucose_readings.json
  def index
    @blood_glucose_readings = BloodGlucoseReading.all
  end

  # GET /blood_glucose_readings/1
  # GET /blood_glucose_readings/1.json
  def show
  end

  # GET /blood_glucose_readings/new
  def new
    @blood_glucose_reading = BloodGlucoseReading.new
    @Patient = Patient.all
  end

  # GET /blood_glucose_readings/1/edit
  def edit
  end

  # POST /blood_glucose_readings
  # POST /blood_glucose_readings.json
  def create
    puts '-----------',params[:blood_glucose_reading][:reading]
    @blood_glucose_reading = BloodGlucoseReading.new(blood_glucose_reading_params)
    puts blood_glucose_reading_params
    puts '---------------------------------------------params----'
    if Integer(params[:blood_glucose_reading][:reading]) >= 100
      @blood_glucose_reading.status = 'max'
     elsif Integer(params[:blood_glucose_reading][:reading]) <= 70
       @blood_glucose_reading.status = 'min'
      else
        @blood_glucose_reading.status = 'avg'
    end
    @patient = BloodGlucoseReading.where(:patient_id => params[:patient_id],:created_at => Date.today )

    if @patient.present?
      patientscount = @patient.count
      puts '----',patientscount
      if patientscount >= 4
        respond_to do |format|
          @Patient = Patient.all
          flash.now[:error] = 'Exceeded the Reading limit to enter only four times a day for the user'
        format.html { render :new }
        end
      elsif patientscount < 4
        @blood_glucose_reading.patient_id = params[:patient_id]
      end
    else
      @blood_glucose_reading.patient_id = params[:patient_id]
    end
    if @blood_glucose_reading.patient_id.present?
      respond_to do |format|
        if @blood_glucose_reading.save
          format.html { redirect_to @blood_glucose_reading, notice: 'Blood glucose reading was successfully created.' }
          format.json { render :show, status: :created, location: @blood_glucose_reading }
        else
          format.html { render :new }
          format.json { render json: @blood_glucose_reading.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /blood_glucose_readings/1
  # PATCH/PUT /blood_glucose_readings/1.json
  def update
    respond_to do |format|
      if @blood_glucose_reading.update(blood_glucose_reading_params)
        format.html { redirect_to @blood_glucose_reading, notice: 'Blood glucose reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @blood_glucose_reading }
      else
        format.html { render :edit }
        format.json { render json: @blood_glucose_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_glucose_readings/1
  # DELETE /blood_glucose_readings/1.json
  def destroy
    @blood_glucose_reading.destroy
    respond_to do |format|
      format.html { redirect_to blood_glucose_readings_url, notice: 'Blood glucose reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood_glucose_reading
      @blood_glucose_reading = BloodGlucoseReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_glucose_reading_params
      params.require(:blood_glucose_reading).permit(:reading, :status, :patient_id)
    end
end
