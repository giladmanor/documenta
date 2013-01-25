class Customer < DataBase
  validates_uniqueness_of :name
end
