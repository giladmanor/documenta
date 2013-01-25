class Role < DataBase
  has_many :users
  has_many :module_permissions
  validates_uniqueness_of :name
end
