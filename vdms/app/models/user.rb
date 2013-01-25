class User < DataBase
  belongs_to :role
  belongs_to :permission_level
  belongs_to :surrogate, :class_name => "User", :foreign_key => "surrogate_id"
  has_many :user_groups
  has_many :groups, :through => :user_groups
  has_many :change_logs
  
  has_many :user_menus, :order => 'ord DESC'
  has_many :fav_menu, :class_name => "ModulePermission", :through => :user_menus
  
  has_many :change_process_users
  has_many :change_processes, :through => :change_process_users
  
  has_one :avatar
  has_one :signature
  
  validates_uniqueness_of :email, :message=> "The email address has already been used"
  validates_presence_of :name, :message=> "Please specify User Name"
  validates_presence_of :l_name, :message=> "Please specify User Last Name"
  validates_presence_of :email, :message=> "Please specify User email adderss"
  validates_presence_of :title, :message=> "Please specify User Title"
  validates_presence_of :password, :message=> "Please specify initial Password"
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  def session_data
    {
      :name => self.to_label,
      :id => self.id,
      :role => self.role.name,
      :permission_level => self.permission_level.value,
      :modules => self.modules.map{|mp| mp.to_info} 
    }
  end
  
  def to_info
    {
      :id => self.id,
      :name => self.to_label
    }
  end

  def to_label
    "#{self.title} #{self.name} #{self.l_name}"
  end
  
  def menu
   self.fav_menu.reject{|mp| mp.read_permission.value > self.permission_level.value}
  end
  
  def modules
    self.role.module_permissions.reject{|mp| mp.read_permission.value > self.permission_level.value}
  end
  
  def documents
    dvs = self.change_logs.document_versions
    dvs.map{|dv| dv.document}.uniq
  end
  
  def commit_document_version(dv)
    cl = ChangeLog.new
    cl.document_versions << dv
    self.change_logs << cl
  end
    
end
