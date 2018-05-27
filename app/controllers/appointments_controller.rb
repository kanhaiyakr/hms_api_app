class AppointmentsController < ApplicationController

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: {status: 'SUCCESS', message:'Saved appointment',data:appointment},status: :ok
    else
      render :json => { :errors => appointment.errors.full_messages }, :status => 422
    end
  end

  def show
    appointment = Appointment.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded appointment',data:appointment},status: :ok
  end

  def appointment_list
    appointments = Appointment.order('created_at DESC')
    render json: {status: 'SUCCESS', message:'Loaded list of appointments',data:appointments},status: :ok
  end

  private
  def appointment_params
    params.require(:appointment).permit(:doctor_id,:patient_id,:diseases)
  end
end
