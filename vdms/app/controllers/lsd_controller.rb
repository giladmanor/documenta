require 'l_s_d'

class LsdController < SessionController
  ActiveRecord::Base.include_root_in_json = false
  
  def identify
    action = params[:action].split("_",2)
    command = action[0]
    entity = action[1].camelize.constantize
    
    if !entity.kind_of? ActiveRecord::Base
      logger.warn "Request Error: #{action[1]} is not a known active record class"
      redirect_to :action => :error 
      return
    end
      
    p = params[:data]
    logger.debug "Using LSD to #{command} a #{action[1]}"
    if command == "list"
      render :json => LSD.list(entity)
    elsif command == "set"
      render :json=>LSD.set(entity,params[:data])
    elsif command == "delete"
      render :json=>LSD.delete(entity,params[:data][:id])
    else 
      redirect_to :action => :error 
    end
    
  end
  
  
end
