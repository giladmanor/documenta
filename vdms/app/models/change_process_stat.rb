class ChangeProcessStat < DataBase
  validates_presence_of(:name, :message => "Please enter a Name")
  validates_uniqueness_of(:name, :message => "Name already taken")
  
  
  
  
  
end
