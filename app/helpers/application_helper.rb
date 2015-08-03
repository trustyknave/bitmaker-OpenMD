module ApplicationHelper

  def show_session_links
    if patient_signed_in?
      link_to 'Log Out', destroy_patient_session_path, method: :delete
    elsif doctor_signed_in?
      link_to 'Log Out', destroy_doctor_session_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

  def show_health_record_link
    if patient_signed_in?
      link_to_unless_current('My Health Record',
        patient_health_record_path(current_patient.id)
      )
    end
  end

  def show_health_status_update_link
    if patient_signed_in?
      link_to_unless_current('+ Health Status Update',
        new_patient_health_status_update_path(current_patient.id)
      )
    end
  end

  def show_home_link
    if patient_signed_in?
      link_to 'Home', patients_path
    elsif doctor_signed_in?
      link_to 'Home', doctors_path
    else
      link_to 'Home', root_path
    end
  end

end
