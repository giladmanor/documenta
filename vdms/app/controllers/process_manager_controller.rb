class ProcessManagerController < SessionController
  
  
  def list_change_processes
    res = @user.change_process_users.map { |cpu| 
      {
        :change_stat => cpu.change_log ? cpu.change_log.change_stat.name : nil,
        :name => "#{cpu.change_process.doc_type_name} #{cpu.change_process.title}",
        :info => cpu.change_process.to_info
      } 
    }
    render :json => res
    logger.debug "\n\n #{res.inspect} \n\n"
  end
  
  def set_change_process
    cp = ChangeProcess.create_or_update(params[:data][:change_process])
    send_mails = false
    unless cp.is_initiated?
      cp.initiator=@user 
      send_mails = true
    end
    
    cp.document_version_id = params[:data][:document_version_id] 
    
    if params[:data][:recipient_ids].present?
      params[:data][:recipient_ids][:item].each{|user_data| cp.add_user(User.find(user_data[:id])) unless user_data.nil? }
    end
    
    if params[:data][:document_ids].present? && !params[:data][:document_ids][:item].nil?
      cp.attached_document_version_ids=params[:data][:document_ids][:item] 
    end
    
    if cp.save
      render :json => {:ok=>"Process Saved"}
    else
      render :json=>{:error=>cp.errors}
    end
    
    if send_mails
      cp.users.each{|recipient| ProcessAnnouncement.initiate(@user,recipient, cp) }
    end
    
  end
  
  
  def approve_change_processes
    cp_id = params[:data][:id]
    cp = ChangeProcess.find(cp_id)
    cp.approve(@user)
    render :json => {:ok=>"", :title=>cp.document_version.to_label}
    cp.users.each{|recipient| ProcessAnnouncement.approve(@user,recipient, cp) }
  end
  
  def reject_change_processes
    cp_id = params[:data][:id]
    comment = params[:data][:comment]
    cp = ChangeProcess.find(cp_id)
    cl = cp.reject(@user,comment)
    logger.debug cp.inspect
    render :json => {:ok=>"", :title=>cp.document_version.to_label, :user_name=>cp.initiator ? cp.initiator.to_label : "You"}
    cp.users.each{|recipient| ProcessAnnouncement.reject(@user,recipient, cp, cl) }
  end
  
  def delegate_change_processes
    cp_id = params[:data][:id]
    comment = params[:data][:comment]
    recipient_id = params[:data][:recipient_id]
    recipient = User.find(recipient_id)
    cp = ChangeProcess.find(cp_id)
    cp.delegate(@user,recipient,comment)
    render :json => {:ok=>"", :title=>cp.document_version.to_label,:user_name=>recipient.to_label}
  end
  
  def list_change_process_logs
    cp_id = params[:data][:id]
    cp = ChangeProcess.find(cp_id)
    render :json => cp.change_logs.map{|cl| cl.to_info}
  end
  
  private
  
  
  
  
end
