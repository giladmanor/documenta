class Disposition < DataBase
  validates_uniqueness_of :name
end
