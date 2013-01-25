class Document < DataBase
  belongs_to :doc_type
  
  has_many :document_groups
  has_many :document_tags
  
  has_many :groups, :through => :document_groups
  has_many :tags, :through => :document_tags
  has_many :document_versions
  
  belongs_to :change_permission_level, :class_name => "PermissionLevel", :foreign_key => "change_permission_level_id"
  belongs_to :read_permission_level, :class_name => "PermissionLevel", :foreign_key => "read_permission_level_id"
  
  validates_presence_of :doc_type_id, :message => "Please set Document Type"
  validates_presence_of :name, :message => "Please set Document Name"
  validates_presence_of :change_permission_level_id, :message => "Please set Write Permissions"
  validates_presence_of :read_permission_level_id, :message => "Please set Read Permissions"
  
  
  def set_groups(groups_data)
    gs = groups_data.map{|e| Group.find(e[:id]) }
    self.groups.clear
    self.groups = gs
  end
  
  def set_tags(tags_data)
    ts = tags_data.map{|e| Tag.fetch(e[:name]) }
    self.tags.clear
    self.tags = ts
  end
  
  def to_info
    {
        :id=> self.id,
        :name => self.name,
        :type => "document",
        :number_of_versions => self.document_versions ? self.document_versions.size : 0,
        :created_at => self.created_at,
        :doc_stat => "",
        :groups => self.groups,
        :tags=> self.tags,
        :change_permission_level_id=>self.change_permission_level_id,
        :read_permission_level_id=>self.read_permission_level_id,
        :doc_type_id=>self.doc_type_id,
        :children =>self.document_versions.map{|dv| dv.to_info}
      }
  end
  
  
end
