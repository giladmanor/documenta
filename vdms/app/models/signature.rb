class Signature < DataBase
  belongs_to :user
  serialize :image
end
