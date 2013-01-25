class PartManagerController < SessionController
  
  def list_assemblies
    roots =  PartVersionAssembly.find(:all, :conditions=> "parent_id=null").reject{|a| !@user.groups.include?(a.group) }
    render :json => roots.map{|a| a.to_tree}
  end
  
  def list_parts
    search = params[:data][:search].present? ? "%#{params[:data][:search]}%" : "%"
    parts =  Part.find(:all, :conditions=> ["name like ? or number like ?", search,search], :limit=>20)#.reject{|a| !@user.groups.include?(a.part_versions[0].group) }
    logger.debug parts.inspect
    render :json => parts.map{|a| a.to_info}
  end
  
  def find_part_by_name_or_number
    parts =  Part.find(:all, :conditions=> ["name = ? or number = ?", name,number], :limit=>20)
    render :json => parts.map{|a| a.to_label}
  end
  
  def get_part_version_info
    pv = PartVersion.find(params[:data][:id])
    logger.debug "\n\n #{pv.to_info.inspect}"
    render :json => pv.to_info
  end
  
  def set_part_version
    part_info = params[:data][:part]
    part_version_info = params[:data][:part_version]
    customer_part_version_info = params[:data][:customer_part_version]
    vendor_part_version_info = params[:data][:vendor_part_version]
    part_version_rma_info = params[:data][:part_version_rma]
    parent_part_version_id = params[:data][:parent_part_version_id]
    
    engineering_docs_ids = params[:data][:engineering_docs][:item]
    process_docs_ids = params[:data][:process_docs][:item]
    drawing_docs_ids = params[:data][:drawing_docs][:item]
    other_docs_ids = params[:data][:other_docs][:item]
    
    part = Part.create_or_update(part_info)
    part_version = PartVersion.create_or_update(part_version_info,@user)
    #change_log = part_version.change_log || ChangeLog
    customer_part_version = CustomerPartVersion.create_or_update(customer_part_version_info.merge({:customer_id=>part_version_info[:customer_id]}))
    vendor_part_version = VendorPartVersion.create_or_update(vendor_part_version_info.merge({:vendor_id=>part_version_info[:vendor_id]}))
    part_version_rma = PartVersionRma.create_or_update(part_version_rma_info)
    
    part_version.part = part
    part_version.customer_part_version = customer_part_version
    part_version.vendor_part_version = vendor_part_version
    part_version.part_version_rma = part_version_rma
    
    part_version.drawing_docs_ids=drawing_docs_ids unless drawing_docs_ids.nil?
    part_version.engineering_docs_ids=engineering_docs_ids unless engineering_docs_ids.nil?
    part_version.other_docs_ids=other_docs_ids unless other_docs_ids.nil?
    part_version.process_docs_ids=process_docs_ids unless process_docs_ids.nil?
        
    if !parent_part_version_id.nil?
      part_version.assembly.set_parent_product_version parent_part_version_id
    end
    
    if part.save && part_version.save #&& vendor_part_version.save && part_version_rma.save && 
      logger.debug "\n\n #{part_version.to_info.inspect}"
      render :json => {:ok => part_version.id}
    else
      render :json => {:error => part.errors || part_version.errors }
    end
    
  end
  
  def set_assembly
    part_version_assembly_info = params[:data][:part_version_assembly]
    part_version_assembly = PartVersionAssembly.create_or_update(part_version_assembly_info)
    if part_version_assembly.save
      render :json => {:ok => part_version_assembly}
    else
      render :json => {:error => part_version_assembly.errors }
    end
  end
  
  def list_assemblies_for_part_version
    pv = PartVersion.find(params[:data][:id])
    render :json => pv.part_version_assembly.children.map{|a| a.part_version.to_info}
  end
  
end
