require 'rubygems'
require 'logger'
#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor
class LSD 
  
  def self.list(entity)
    a=entity.find(:all).map{|g| g}#.sort{ |a,b| a["name"]<=>b["name"]}
    logger.debug a.inspect
    a
  end
  
  def self.set(entity,p)
    a = entity.create_or_update(p)
    if a.save
      {:ok=>"#{entity.class.name} Saved"}
    else
      logger.debug a.errors.inspect
      {:error=>a.errors}
    end
  end
  
  def self.delete(entity,id)
    a = entity.find(id)
    a.destroy
    {:ok=>"#{entity.class.name} Deleted"}
  end
  
  def self.logger
    Rails.logger
  end
  
  
end
