class ChangeStat < DataBase
  has_many :change_logs
  
  validates_uniqueness_of :name
  
  def self.find_by_code(code)
    ChangeStat.first(:conditions=>"code = '#{code}'") 
  end
  
end
