class HealthStatusUpdatesController < ApplicationController
  before_filter :authenticate_patient!

  def index
    @health_status_updates = current_patient.health_status_updates
  end

  def show
    @health_status_update = current_patient.health_status_updates(
      health_status_update_params(:id)
    )
  end

  def new
    @health_status_update = HealthStatusUpdate.new
  end

  def edit
  end

  def create
    @health_status_update = HealthStatusUpdate.new(health_status_update_params)
    @health_status_update.patient = current_patient

    if @health_status_update.save
      redirect_to patient_health_status_updates_url
    else
      render :new
    end
  end

  def update
  end

  private
  def health_status_update_params
    params.require(:health_status_update).permit(
      :respiratory_rate,
      :heart_rate,
      :body_temperature,
      :blood_pressure,
      :physical_health_score,
      :mental_health_score
    )
  end

  def current_health_status_update
    current_patient.health_status_updates.find()
  end
end