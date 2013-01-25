class PartVersion < DataBase
  belongs_to :part
  
  belongs_to :change_log,:autosave=>true
  belongs_to :group
  #belongs_to :part_mode
  belongs_to :vendor
  belongs_to :customer
  belongs_to :part_version_stat
  
  has_one :customer_part_version ,:autosave=>true
  has_one :vendor_part_version,:autosave=>true
  has_one :part_version_rma,:autosave=>true
  
  has_one :part_version_assembly,:autosave=>true
  
  #has_many :document_version_parts
  #has_many :document_versions, :through=>:document_version_parts
  
  has_many :part_version_drawing_docs
  has_many :drawing_docs, :through => :part_version_drawing_docs, :class_name=>"DocumentVersion", :source => :document_version
  
  has_many :part_version_engineering_docs
  has_many :engineering_docs, :through => :part_version_engineering_docs, :class_name=>"DocumentVersion", :source => :document_version
  
  has_many :part_version_other_docs
  has_many :other_docs, :through => :part_version_other_docs, :class_name=>"DocumentVersion", :source => :document_version
  
  has_many :part_version_process_docs
  has_many :process_docs, :through => :part_version_process_docs, :class_name=>"DocumentVersion", :source => :document_version
  
  def set_document_version_ids(rel,ids)
    rel.clear
    ids.compact.each{|i|
      dv = DocumentVersion.find(i)
      rel <<dv
    }
  end
  
  def drawing_docs_ids=(ids)
    set_document_version_ids(self.drawing_docs,ids)
  end
  
  def engineering_docs_ids=(ids)
    set_document_version_ids(self.engineering_docs,ids)
  end
  
  def other_docs_ids=(ids)
    set_document_version_ids(self.other_docs,ids)
  end
  
  def process_docs_ids=(ids)
    set_document_version_ids(self.process_docs,ids)
  end
  
  
  def assembly
    pva = self.part_version_assembly
    
    if !pva.nil?
      logger.debug "#Part version #{self.id} is using -->#{pva.inspect}"
      pva
    else
      logger.debug "#Part version #{self.id} is making a new Assembly"
      pva = PartVersionAssembly.new
      pva.change_log = self.change_log
      pva.part_version = self
      pva.save
      pva
    end
  end
  
  def to_label
    "#{self.part.name} #{self.part.number} #{self.id}"
  end
  
  
  
  def to_info
    logger.debug self.inspect
    {
      :id => self.id,
      :label => self.to_label,
      :part => self.part,
      :part_zero_change_log => self.part.part_versions[0].change_log.to_info,
      :part_version => self,
      :customer_part_version => self.customer_part_version,
      :vendor_part_version => self.vendor_part_version,
      :part_version_rma => self.part_version_rma,
      :change_log => self.change_log.to_info,
      :parent_part_version_id => self.get_parent_id,
      :drawing_docs => self.drawing_docs.map{|d| d.id},
      :engineering_docs => self.engineering_docs.map{|d| d.id},
      :other_docs => self.other_docs.map{|d| d.id},
      :process_docs => self.process_docs.map{|d| d.id}
    }
  end
  
  def get_parent_id
    self.assembly.parent.nil? ? nil : self.assembly.parent.part_version.id
  end
  
  
  def self.create_or_update(args, user)
    instance = args[:id].present? ? self.find(args[:id]) : self.new(args)
    force_new = instance.part_version_stat.code == "immutable"
    if !instance.new_record? && force_new
      instance = self.new(args.except(:id))
    else
      instance.update_attributes(args.except(:id))  
    end
    instance.change_log = ChangeLog.create_or_update(instance.change_log,user,force_new)
    instance
  end
  
end
