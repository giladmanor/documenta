class Group < DataBase
  has_many :user_groups
  has_many :document_groups
  
  has_many :users, :through => :user_groups
  has_many :documents, :through => :document_groups
  
  validates_uniqueness_of :name
end
