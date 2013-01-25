class Part < DataBase
  has_many :part_versions
  
  validates_uniqueness_of :name, :message=>"Part Name has been taken"
  validates_uniqueness_of :number, :message=>"Part Number has been taken"
  
  def to_info
    {
      :id => self.id,
      :label => self.to_label,
      :type => "part",
      :name => self.name,
      :number => self.number,
      :children => self.part_versions.map{|pv| {:id=>pv.id, :label =>"REV #{pv.id} #{pv.part_version_stat.name}", :type=>"part_version", :part_label=> self.to_label}}
    }
  end
  
  def to_label
    "#{self.name} #[#{self.number}] #[Revisions: #{self.part_versions.size}]"
  end
  
  
  
end
