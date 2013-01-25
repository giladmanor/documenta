require 'date'
require 'tokenizer'
require 'zipper'
require 'l_s_d'

#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor

class SessionController < ApplicationController
  before_filter :request_filter, :check_user
  skip_before_filter :request_filter, :only => [:login,:error,:request_password]
  skip_before_filter :check_user, :only => [:login,:error,:request_password]
  
  #------------------------------------------------------------------------------------------------------------------------------------------
  
  def login
    logger.debug "login"
    email = params[:user][:email]
    pwd = params[:user][:password]
    logger.debug "login attempt by #{email}:"
    users = User.find(:all, :conditions => ["email = ? AND password = ?", email,pwd])
    
    if(users.length == 1)
      user = users[0]
      g_s[:user] = user.id
      g_s[:timestamp] = Time.now
      
      logger.warn "User #{user.email} Logged in"
      #logger.warn "[LoginController#login] session: #{g_s[:session_id]} "
      #logger.warn "[LoginController#login] session: #{g_s.to_yaml} "
      render :json => user.session_data
    else
      logger.warn "login failed "
      render :json => {:error=>"bad login"}
    end
  end
  
  def list_fav_menu
    render :json => @user.fav_menu.map { |mp| mp.to_info }
  end
  
  
  def url_redirect_to_home
    redirect_to("/index.html")
  end
  
  
  def request_password
    email = params[:user][:email]
    users = User.find(:all, :conditions => ["email = ?", email])
    if users.length==0
      render :text => "Problem sending mail to: #{email}, Please contact your system administrator."
      return
    end
    
    
    host = url_for(:controller => 'session', :action => 'url_redirect_to_home')
    IForgotMyPassword.password_reminder(users[0], host)
    render :text => "Password sent to: #{email}, Please check your e-mail."
  end
  
  def change_password
    old_p = params[:data][:old].to_s
    new_p = params[:data][:new].to_s
    
    if @user.password == old_p
      @user.password = new_p
      @user.save
      render :json => {:ok=>"New password has been set successfuly"}
    else
      render :json => {:error=>"Error: Incorrect Old Password"}
    end
    
    
  end
  
 
  #------------------------------------------------------------------------------------------------------------------------------------------
  
  def error
    render :nothing, :status => 403 # forbidden
  end
  
  
  def request_filter
    logger.debug "\n\n Request Filter #{params[:action]} From[#{request.remote_ip}]"
    
    user_id = g_s[:user] if g_s[:user].present?
    user_id = velidate_token(params[:token]) if params[:token].present?
    
    if user_id.nil?
      logger.warn "(!) Invalid session"
      redirect_to :action => :error 
      return
    end
    
    @user = User.find(user_id)
    timestamp = g_s[:timestamp]
    logger.warn "Session Timestamp: #{timestamp.to_s} for user: #{@user.email}"
    unless !@user.nil? #|| (Time.now - timestamp) > 100000
      logger.warn "(!) Fraud Alert From IP #{request.remote_ip}"
      redirect_to :action => :error 
      return
    end
    
  end
  
  def get_session_token
    render :text => Tokenizer.get_token(@user)
  end
  
  #------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  
  private
  
  def velidate_token(token)
    Tokenizer.use_token(token)
  end
  
  
  
  def g_s
    cookies
  end
  
end
