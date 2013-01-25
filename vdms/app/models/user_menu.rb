class UserMenu < ActiveRecord::Base
  belongs_to :user
  belongs_to :module_permissions
end
