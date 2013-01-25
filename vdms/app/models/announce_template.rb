class AnnounceTemplate < DataBase
  validates_presence_of :template
  validates_uniqueness_of :name
  
end
