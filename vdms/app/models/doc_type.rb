class DocType < DataBase
  has_many :documents
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
end
