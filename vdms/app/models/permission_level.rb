class PermissionLevel < DataBase
  validates_uniqueness_of :name
end
