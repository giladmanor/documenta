class ProcessAnnouncement < ActionMailer::Base
  default :from => "VDMS@vsi-hmcs.com"
  
  def approve(user,recipient, change_process)
    @change_process  = change_process
    @user = user
    @recipient = recipient
    begin
      mail(:to => recipient.email, :subject => "VDMS Change Process #{change_process.to_label}").deliver
    rescue
      logger.debug "Error Sending mail to: #{recipient.email} "
    end
    logger.debug "Sent announcement to: #{recipient.email} "
    
  end
  
  def reject(user,recipient, change_process, change_log)
    @change_log = change_log
    @change_process  = change_process
    @user = user
    @recipient = recipient
    begin
      mail(:to => recipient.email, :subject => "VDMS Change Process #{change_process.to_label}").deliver
    rescue
      logger.debug "Error Sending mail to: #{recipient.email} "
    end
    logger.debug "Sent announcement to: #{recipient.email} "
    
  end
  
  def delegate(user,recipient, change_process)
    @change_process  = change_process
    @user = user
    @recipient = recipient
    begin
      mail(:to => recipient.email, :subject => "VDMS Change Process #{change_process.to_label}").deliver
    rescue
      logger.debug "Error Sending mail to: #{recipient.email} "
    end
    logger.debug "Sent announcement to: #{recipient.email} "
    
  end
  
  def initiate(user,recipient, change_process)
    @change_process  = change_process
    @user = user
    @recipient = recipient
    begin
      mail(:to => recipient.email, :subject => "VDMS Change Process #{change_process.to_label}").deliver
    rescue
      logger.debug "Error Sending mail to: #{recipient.email} "
    end
    logger.debug "Sent announcement to: #{recipient.email} "
    
  end
  
end
