class DocStat < DataBase
  has_many :documents
  
  validates_uniqueness_of :name
  
end
