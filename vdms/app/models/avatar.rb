class Avatar < DataBase
  belongs_to :user
  serialize :image
end
