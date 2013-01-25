class ChangeProcessUser < DataBase
  belongs_to :change_process
  belongs_to :user
  belongs_to :change_log
  
  #validates_uniqueness_of :user,:scope=> :change_process, :message => "User already attached"
  
  
  def to_info
    cl = self.change_log
    {
      :id=>self.id,
      :action_code =>cl.nil? ? nil : self.change_log.action_code,
      :change_stat => cl.nil? ? nil : self.change_log.change_stat,
      :created_at => cl.nil? ? nil : self.change_log.created_at.to_s,
      :updated_at => cl.nil? ? nil : self.change_log.updated_at.to_s,
      :user => self.user.to_info
    }
  end
  
  
  
end
