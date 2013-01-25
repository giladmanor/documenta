class Attachement < DataBase
  belongs_to :owner, :class_name => "DocumentVersion", :foreign_key => "owner_id"
  belongs_to :owned, :class_name => "DocumentVersion", :foreign_key => "owned_id"
end
