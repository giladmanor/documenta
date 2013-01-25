class ChangeLog < DataBase
  belongs_to :user
  belongs_to :action_code
  belongs_to :change_stat
  
  belongs_to :delegate, :class_name=>"User"
  
  has_many :document_version_change_logs
  has_many :document_versions, :through => :document_version_change_logs
  
  def action=(code)
    self.action_code = ActionCode.find_by_code(code)
  end
  
  def stat=(code)
    self.change_stat = ChangeStat.find_by_code(code)
  end
  
  
  
  #------------------------------------------------------------------------------------
  
  def to_info
    {
      :id=>self.id,
      :action_code =>self.action_code,
      :change_stat => self.change_stat,
      :created_at => self.created_at.to_s,
      :updated_at => self.updated_at.to_s,
      :user => self.user.to_info
    }
  end
  
  def self.create_or_update(obj, user,force_new=false)
    if obj.nil? || force_new || obj.user!=user
      obj=ChangeLog.new
      obj.user = user
    else
      obj.touch
    end
    obj
  end

end
