class PatientsController < ApplicationController

  def create
    patient = Patient.new(patient_params)

    if patient.save
      render json: {status: 'SUCCESS', message:'Saved patient',data:patient},status: :ok
    else
      render :json => { :errors => patient.errors.full_messages }, :status => 422
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name,:phone)
  end
end
