class DataBase < ActiveRecord::Base
  self.abstract_class = true
  
  alias :super_create_or_update :create_or_update
  
  def self.create_or_update(args)
    logger.debug "create_or_update #{self.name}"
    instance = args[:id].present? ? self.find(args[:id]) : self.new(args)
    instance.update_attributes(args.except(:id))
    instance
  end
  
end
