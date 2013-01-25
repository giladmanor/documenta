class DocumentVersion < DataBase
  belongs_to :document
  belongs_to :doc_stat
  
  has_many :change_logs, :through => :document_version_change_logs
  has_many :tags, :through => :document_version_tags
  has_many :owned, :through => :attachement
  has_many :owner, :through => :attachement
  
  has_one :document_data
  
  has_one :change_process
  #validates_presence_of :doc_stat_id, :message => "Please set Document Status"
  
  
  def set_data(file_name,obj)
    self.file_name = file_name
    dd= self.document_data.nil? ? DocumentData.new : self.document_data
    dd.data = obj
    dd.document_version=self
    if dd.save
      return true, self
    else
      return false, dd
    end
    
  end
  
  def to_info
    {
      :id => self.id,
      :name => self.to_label,
      :type => "document_version",
      :document => self.document,
      :file_name=>self.file_name,
      :created_at => self.created_at,
      :updated_at => self.created_at,
      :doc_stat => self.doc_stat ? self.doc_stat.name : "N/A",
      :doc_stat_id => self.doc_stat_id,
      :can_initiate_process=> self.change_process.nil?
    }
  end
  
  def to_label
    "#{self.document.doc_type.name}_#{self.document.id}_#{self.document.name}_REV_#{self.id}"
  end
  
end
