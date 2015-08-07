module DoctorsHelper

  def show_connection_link(doctor)
    if current_patient.doctors.include?(doctor) == true
      connection = current_patient.relationships.find_by(doctor_id: doctor.id).id

      link_to "Remove connection", delete_patient_connection_path(
        :patient_id => current_patient.id, :doctor_id => doctor.id, :id => connection), :method => :post
    else
      link_to "Send connection request", patient_connection_request_path(
        :patient_id => current_patient.id,
        :doctor_id => doctor.id
      ), :method => :post
    end
  end

end
