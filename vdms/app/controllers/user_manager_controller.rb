class UserManagerController < SessionController
  
  def set_user
    user = params[:data][:user][:id].present? ? User.find(params[:data][:user][:id]) : User.new(params[:data][:user])
    user.update_attributes(params[:data][:user])
    
    groups = box_as_array(params[:data][:groups][:item])
    
    logger.debug groups.inspect
    user.groups.clear
    
    groups.each{|g| 
      if !g.nil?
        group = Group.find(g[:id])
        user.groups << group
      end
    }
    
    if user.save
      render :json=>{:ok=>"User Saved"}
    else
      logger.debug user.errors.inspect
      render :json=>{:error=>user.errors}
    end
  end
  
  def list_users
    filter=params[:data][:filter] .present? ? "%#{params[:data][:filter] }%" : "%"
    
    users = User.find(:all,:conditions=>["name like ? or l_name like ? or email like ?",filter,filter,filter],:order=>"l_name",:limit=>50)
    render :json=> users.map{|u|
    logger.debug "USER #{u.name} belongs to #{u.groups.map{|g|{:id=>g.id}}} "
    {
      :label=>"#{u.name} #{u.l_name} #{u.email}",
      :id=>u.id,
      :name=>u.name,
      :l_name=>u.l_name,
      :email=>u.email,
      :title=>u.title,
      :password=>u.password,
      :role_id=>u.role_id,
      :permission_level_id=>u.permission_level_id,
      :surrogate=> u.surrogate.nil? ? nil : {:id=>u.surrogate.id,:name=>"#{u.surrogate.name} #{u.surrogate.l_name}"},
      #:avatar=>u.avatar,
      #:signature_image=>u.signature_image,
      :groups=>u.groups.map{|g|{:id=>g.id}}
    }}
end
  
  def delete_user
    user = User.find(params[:data][:id])
    user.destroy
    render :json=>{:ok=>"User Deleted"}
  end
  
  def set_avatar
    user = User.find(params[:id])
    a= user.avatar.nil? ? Avatar.new : user.avatar
    a.image = params[:Filedata].read
    a.user=user
    
    if a.save
      render :json=>{:ok=>"User Image Saved"}
    else
      logger.debug a.errors.inspect
      render :json=>{:error=>a.errors}
    end
  end
  
  def get_avatar
    user = User.find(params[:id])
    render :content_type => 'application/octet-stream', :text=> user.avatar.nil? ? nil : user.avatar.image
   
  end
  
  def set_signature_image
    user = User.find(params[:id])
    a= user.signature.nil? ? Signature.new : user.signature
    a.image = params[:Filedata].read
    a.user=user
    
    if a.save
      render :json=>{:ok=>"User Image Saved"}
    else
      logger.debug a.errors.inspect
      render :json=>{:error=>a.errors}
    end
  end
  
  def get_signature_image
    user = User.find(params[:id])
    render :content_type => 'application/octet-stream', :text=> user.signature.nil? ? nil : user.signature.image
   
 end
 
 def get_user_name
   user = User.find(params[:data][:id])
   render :json => {:name => "#{user.name} #{user.l_name}"}
 end
 
  
  
end
