class Tag < DataBase
  has_many :documents, :through => :document_tags
  has_many :document_versions, :through => :document_version_tags
  
  validates_uniqueness_of :name
  
  def self.fetch(tag_name)
    tag = Tag.find_or_create_by_name(tag_name)
    if !tag.persisted?
      tag.save
    end
    tag
      
  end
  
  
  
  
end
