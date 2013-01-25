class DocumentVersionChangeLog < DataBase
  belongs_to :document_version
  belongs_to :change_log
end
