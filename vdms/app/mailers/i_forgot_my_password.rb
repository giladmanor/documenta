class IForgotMyPassword < ActionMailer::Base
  default :from => "VDMS@vsi-hmcs.com"
  
  def password_reminder(user, host)
    @user = user
    @url  = "#{host}"
    mail(:to => user.email, :subject => "VDMS Password Reminder").deliver
    logger.debug "Sent password to: #{user.email} #{user.inspect} #{@url.to_s}"
    logger.debug smtp_settings.inspect
  end
end
