class DoctorsController < ApplicationController

  def create
    doctor = Doctor.new(doctor_params)

    if doctor.save
      render json: {status: 'SUCCESS', message:'Saved doctor',data:doctor},status: :ok
    else
      render :json => { :errors => doctor.errors.full_messages }, :status => 422
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name,:phone,:specialization)
  end
end
