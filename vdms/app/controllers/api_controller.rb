class ApiController < ActionController::Base
  before_filter :check_key
  
  def check_key
    unless params[:data][:key].present? && params[:data][:key]=="some very long string we will agree upon"
      render :nothing, :status => 403 # forbidden
      return false
    end
  end
  
  
  def set_part
    part_number                        = params[:data][:part][:Partnumber]
    
    part = Part.find(:all, :condition=>"number=#{part_number}").first || Part.new
    part.number = part_number
     
    part_version = PartVersion.new
    customer_part_version = CustomerPartVersion.new
    vendor_part_version = VendorPartVersion.new
    part_version_rma = PartVersionRma.new
    
    user_email                         = params[:data][:key][:UserID]
    part_version.nomenclature          = params[:data][:part][:Description]
    part_version.cage_code             = params[:data][:part][:Supplier_Cage_Code]
    part_version.natl_stock_number     = params[:data][:part][:National_Stock_Number]
    part_version.vendor_id             = params[:data][:part][:VendorID]
    part_version.group_id              = params[:data][:part][:Program]
    part_version_rmas.nomenclature     = params[:data][:part][:RMA_Nomenclature]
    part_version_rmas.uid_desc         = params[:data][:part][:UIDDesc]
    vendor_part_version.uid_desc       = params[:data][:part][:UIDDesc]
    part_version_rmas.source_of_repair = params[:data][:part][:SOR_Vendor_ID]
    customer_part_version.part_number  = params[:data][:part][:Cust_Partnumber]
    customer_part_version.nomenclature = params[:data][:part][:Cust_Nomenclature]
    vendor_part_version.part_number    = params[:data][:part][:VendorPN]
    vendor_part_version.cage_code      = params[:data][:part][:Vendor_CageCode]
    vendor_part_version.is_serialized  = params[:data][:part][:SerializedFlag]
    part_version.status                = params[:data][:part][:PartStatus]
    
    part_version.part = part
    part_version.customer_part_version = customer_part_version
    part_version.vendor_part_version = vendor_part_version
    part_version.part_version_rma = part_version_rma
    
    if part.save && part_version.save #&& vendor_part_version.save && part_version_rma.save && 
      logger.debug "\n\n #{part_version.to_info.inspect}"
      render :json => {:ok => part_version.id}
    else
      render :json => {:error => part.errors || part_version.errors }
    end
    
    
  end
  
  def set_compliance
    
  end
  
    
  
end
