class CustomerPartVersion < DataBase
  belongs_to :customer
  belongs_to :part_version
end
