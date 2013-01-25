
# This Library extends basic classes in the ruby language
# Hooked to the application in the config/configuration.rb file
#by declaring *require "vs_extentions"*

#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor
  
  class Array
    
    #groups an array into a hash using the keys collected in values of the field entered as the +group_by+ argument.
    #dependant on the existance of the hash extention +group+
    def group(group_by, &block)
      res = {}
      self.each{|item| res.group(item[group_by], yield(item))}
      res
    end
  end



# Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor

  class Hash
    #adds a value to an array that is residant under the key
    def group label,value
      l = label.to_sym
      self[l] = [] unless self.key?(l)
      self[l] << value
    end
  end
  
