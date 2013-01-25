class ChangeProcessDocumentVersion < DataBase
  belongs_to :change_process
  belongs_to :document_version
    
  #validates_uniqueness_of :document_version,:scope=> :change_process, :message => "Document already attached"
    
end
