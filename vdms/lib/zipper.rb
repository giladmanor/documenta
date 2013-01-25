require 'rubygems'
require 'logger'
require "zlib"
#Valueshine ltd copy rights 2011 valueshine.com by Gilad Manor
class Zipper 
  
  def self.deflate(string)
    z = Zlib::Deflate.new(Zlib::BEST_COMPRESSION)
    dst = z.deflate(string, Zlib::FINISH)
    z.close
    dst
  end
  
  def self.inflate(string)
    zstream = Zlib::Inflate.new
    buf = zstream.inflate(string)
    zstream.finish
    zstream.close
    buf
  end
  
  def self.logger
    RAILS_DEFAULT_LOGGER
  end
  
end
