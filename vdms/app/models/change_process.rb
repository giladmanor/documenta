class ChangeProcess < DataBase
  #belongs_to :group
  #belongs_to :flow_step
  
  belongs_to :document_version
  #belongs_to :change_process_stat
  
  has_many :users, :through => :change_process_users, :order => "ord DESC"
  
  has_many :change_process_document_versions
  has_many :attached_documents, :class_name => "DocumentVersion", :through => :change_process_document_versions, :source => :document_version
  
  has_many :change_process_users
  has_many :change_logs, :through => :change_process_users
  
  def permission_level
    self.document_version.nil? ? nil : self.document_version.document.change_permission_level
  end
  
  def change_stat
    self.change_logs.min { |a, b| a.change_stat.value <=> b.change_stat.value }
  end
  
  def doc_name
    self.document_version.nil? ? "[No Document]" : self.document_version.document.name
  end
  
  def doc_type_name
    self.document_version.nil? ? nil : self.document_version.document.doc_type.name
  end
  
  
  #-----------------------------------------------
  
  def approve(user)
    cl = get_change_log(user)
    cl.action=:approve
    cl.stat=:approved
    set_change_log(cl,user)
  end
  
  def reject(user,comment)
    cl = get_change_log(user)
    cl.action=:reject
    cl.stat=:rejected
    cl.comments = comment
    set_change_log(cl,user)
  end
  
  def delegate(user,recipient,comment)
    cl = get_change_log(user)
    cl.action=:delegate
    cl.stat=:delegated
    cl.comments = comment
    cl.delegate = recipient
    add_user(recipient)
    set_change_log(cl,user)
  end
  
  def get_change_log(user)
    cls = change_logs.where(:user_id=>user.id)
    logger.debug " found :::::::  #{cls.inspect}"
    ChangeLog.create_or_update(cls[0], user)
  end
  
  def initiator
    cls = change_logs.where(:action_code_id=>ActionCode.find_by_code(:initiate).id)
    cls[0] ? cls[0].user : nil
  end

  def initiator=(user)
    cl = ChangeLog.new
    cl.user = user
    cl.action=:initiate
    cl.stat= :pending
    cl.comments=''
    cl.save
    set_change_log cl, user
  end
  
  def set_change_log(cl,user)
    logger.debug " setting change log:::: #{cl.inspect}"
    
    clus = self.change_process_users.where(:user_id => cl.user.id) 
    clu = clus[0] || ChangeProcessUser.new
    clu.change_log = cl
    clu.user = cl.user = user
    cl.save
    clu.change_process = self
    logger.debug "Save change log:#{clu.save}"
    cl
  end
  
  def is_initiated?
    logger.debug self.inspect
    !self.change_process_users.nil? && self.change_process_users.length>0
  end
  
  def add_user(user)
    clus = self.change_process_users.where(:user_id => user.id) 
    if clus.length==0
      logger.debug "Adding user #{user.to_label} to #{self.title}"
      clu = ChangeProcessUser.new
      clu.user = user
      self.change_process_users << clu
    end
  end
  
  def attached_document_version_ids=(ids)
    self.attached_documents.clear
    logger.debug ids.compact.inspect
    ids.compact.each{|i|
      dv = DocumentVersion.find(i)
      logger.debug dv.inspect
      self.attached_documents << dv
    }
  end
  
  #-----------------------------------------------
  
  def to_info
    {
      :id => self.id,
      :stat => self.change_stat,
      :title => self.title,
      :desc => self.desc,
      :permission_level => self.permission_level,
      :doc_type => self.doc_type_name,
      :document_info => self.document_version.nil? ? nil : self.document_version.to_info,
      :attachements => self.attached_documents.map{|dv| dv.id},
      :users => self.change_process_users.group(:bunch) {|u| u.user.to_info},
      :initiator => self.initiator,
      :change_logs => self.change_process_users.map{|cl| cl.to_info}
    }
  end
  
  def to_label
    self.title
  end
  
  
    
end
