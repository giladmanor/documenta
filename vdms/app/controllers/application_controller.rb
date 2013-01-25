
require 'l_s_d'

class ApplicationController < ActionController::Base
  #protect_from_forgery
  before_filter :check_user
  
  def check_user
    unless @user
      render :nothing, :status => 403 # forbidden
      return false
    end
  end
  
  
  
  def deployment_stamp
    render :text => "VS Deployed at: #{File.atime(__FILE__)}"
  end
  
  def method_missing(m, *args, &block)
    logger.warn "Method Missing #{m}"
    ActiveRecord::Base.include_root_in_json = false
    render :json => identify(params)
  end
  
  def identify(params)
    action = params[:action].split("_",2)
    command = action[0]
    entity = (command != "list") ? action[1] : action[1].singularize
    logger.debug "#{action[1]}  >>>>>>>>>> #{entity}"
    entity = entity.camelize.constantize
    p = params[:data]
    logger.debug "Using LSD to #{command} #{action[1]}"
    if command == "list"
      LSD.list(entity)
    elsif command == "set"
      LSD.set(entity,params[:data])
    elsif command == "delete"
      LSD.delete(entity,params[:data][:id])
    else 
      redirect_to :action => :error 
    end
  end
  
  def box_as_array(arr)
    if arr.nil? || !arr.kind_of?(Array)
      res = []
      res << arr
    else
      arr
    end
  end
  
end
