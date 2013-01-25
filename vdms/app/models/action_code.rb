class ActionCode < DataBase
  belongs_to :permission_level
  belongs_to :announce_template
  
  validates_uniqueness_of :name, :scope => :permission_level_id
  validates_presence_of :name
  
  
  def self.find_by_code(code)
    ActionCode.first(:conditions=>"code = '#{code}'") 
  end
  
  
end
