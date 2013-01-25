class PartVersionAssembly < DataBase
  acts_as_tree
  
  belongs_to :part_version
  belongs_to :change_log
  
  def to_tree
    {
        :id=>self.id,
        :name=>self.part_version.part.name,
        :number=>self.part_version.part.number,
        :part_version_id=> self.part_version.id,
        :children => self.children.map{|c| c.to_tree}
    }
  end
  
  def set_parent_product_version(parent_id)
    parent = PartVersion.find(parent_id)
    parent.assembly.save if parent.assembly.new_record?
    self.parent = parent.assembly
  end
  
  
  
  
end
