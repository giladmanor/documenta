class DocumentData < DataBase
  belongs_to :document_version
  serialize :data
  
end
