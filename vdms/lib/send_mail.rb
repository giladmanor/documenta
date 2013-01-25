require 'net/smtp'
#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor
class SendMail 
  
  def self.send(smtp_settings,sender, recipient,subject,body)
    host = smtp_settings['address'] 
    port = smtp_settings['port'] 
    domain = smtp_settings['domain'] 
    username = smtp_settings['user_name'] 
    password = smtp_settings['password'] 
    auth = smtp_settings['authentication'] 
    sender_mail = sender.email
    sender_name = "#{sender.name} #{sender.l_name}"
    
    message = <<MESSAGE_END
From: #{sender_name} <#{sender_mail || "noreply@"+domain}>
To: A Test User <#{recipient}>
MIME-Version: 1.0
Content-type: text/html
Subject: #{subject}

#{body}
MESSAGE_END

    res = ""
    Net::SMTP.start(host ,port,domain, username, password, auth) do |smtp|
      res = smtp.send_message message, sender_mail, recipient 
    end
    res
  end

  
end
