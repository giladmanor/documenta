class ModulePermission < DataBase
  belongs_to :role
  belongs_to :change_permission, :class_name => "PermissionLevel", :foreign_key => "change_permission_level_id"
  belongs_to :read_permission, :class_name => "PermissionLevel", :foreign_key => "read_permission_level_id"
  
  serialize :params
  
  validates_uniqueness_of :name, :scope=> :role_id
  
  def to_info
    {
      :implementor=>self.implementor, 
      :change_level=> self.change_permission.value, 
      :name=> self.name, 
      :menu=> self.menu, 
      :icon=> self.icon, 
      :params=> self.params
    }
  end
  
  
  
end
