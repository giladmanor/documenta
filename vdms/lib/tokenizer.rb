require 'rubygems'
require 'logger'

require 'date'
#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor
class Tokenizer 
  
  def self.get_token(object)
    timestamp = Time.now.to_datetime.strftime "%j-%k-%M-%N"
    logger.debug " Token TimeStamp: >>>>>>>>>>>>>>> #{timestamp.inspect}"
    token =  "--#{object.class.name}--#{object.id}--#{timestamp}--"
    Rails.cache.write(token,{:time=>Time.now, :id=>object.id})
    token
  end
  
  def self.use_token(token_id,time_limit=30)
    token = Rails.cache.read(token_id) 
    Rails.cache.delete(token_id)
    logger.debug ">> token: #{token.inspect}"
    if(token!=nil && (Time.now - token[:time] < time_limit))
      token[:id]
    else
      nil
    end
  end
  
 def self.logger
    RAILS_DEFAULT_LOGGER
  end
  
end
