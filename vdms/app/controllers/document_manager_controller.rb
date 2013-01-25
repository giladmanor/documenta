class DocumentManagerController < SessionController


def set_document
    doc_data = params[:data][:doc_data]
    doc_version_data = params[:data][:doc_version_data]
    blob = params[:data][:blob].present? ? params[:data][:blob] : nil
    groups_data = params[:data][:groups_data].present? ? params[:data][:groups_data][:item] : nil
    tags_data = params[:data][:tags_data].present? ? params[:data][:tags_data][:item] : nil
    
    logger.debug "\n\ndoc_data:#{doc_data.inspect}"
    logger.debug "\n\ndoc_version_data:#{doc_version_data.inspect}"
    logger.debug "\n\ngroups_data:#{groups_data.inspect}"
    logger.debug "\n\ntags_data:#{tags_data.inspect}"
    logger.debug "\n\nBLOB:#{blob.inspect}"
    
    document = Document.create_or_update(doc_data)
    document.set_groups groups_data.compact if !groups_data.nil?
    document.set_tags tags_data.compact if !tags_data.nil?
    
    logger.debug "\n\ndocument:#{document.inspect}"
    
    if document.save
      logger.debug "\n\ndocument saved:#{document.id.to_s}"
      document_version = DocumentVersion.create_or_update(doc_version_data || {})
      document_version.document = document
      
      did_save, dvdd = blob ? document_version.set_data(nil,blob) : true,nil
      
      if did_save && document_version.save
        @user.commit_document_version(document_version)
        logger.debug "\n\ndocument_version saved:#{document.id.to_s}"
        render :json=>{:ok=>"Document/Version Saved", :document_id=>document.id, :document_version=>document_version.to_info}
      else
        logger.debug document_version.errors.inspect
        render :json=>{:error=>document_version.errors}
        return
      end
      
    else
      logger.debug document.errors.inspect
      render :json=>{:error=>document.errors}
      return
    end
  end
  
  def set_document_data
    dv = DocumentVersion.find(params[:id])
    file_name = params[:Filename].present? ? params[:Filename] : nil
    
    did_save, dvdd = dv.set_data(file_name,params[:Filedata].read)
    if did_save
      dvdd.save
      render :json=>{:ok=>"Document Version Data Saved", :file_name=>dvdd.file_name}
    else
      logger.debug dvdd.errors.inspect
      render :json=>{:error=>dvdd.errors}
    end
  end
  
  def get_document_blob
    dv = DocumentVersion.find(params[:data][:id])
    logger.debug dv.document_data.nil? ? nil : dv.document_data.data.inspect
    render :json=> dv.document_data.nil? ? nil : dv.document_data.data
  end
  
  
  def get_document_data
    dv = DocumentVersion.find(params[:id])
    render :content_type => 'application/octet-stream', :text=> dv.document_data.nil? ? nil : dv.document_data.data
  end
  
  
  def list_documents
    
    group_docs = params[:data][:group_id].present? ? Group.find(params[:data][:group_id]).documents : nil
    user_docs = params[:data][:user_id].present? ? User.find(params[:data][:user_id]).documents : nil
    type_id = params[:data][:doc_type_id].present? ? " and doc_type_id = #{params[:data][:doc_type_id]}" : ""
    doc_stat_id = params[:data][:doc_stat_id].present? ? " and doc_stat_id = #{params[:data][:doc_stat_id]}" : ""
    conditions = "#{type_id} #{doc_stat_id}"
    search_text = "%#{params[:data][:search]}%"
    scope = user_docs || group_docs || Document
    
    documents = scope.find(:all, :conditions=>["name like ? #{conditions}",search_text])
    render :json => documents.map{|doc| doc.to_info }
  end
  
  def list_document_versions
    ActiveRecord::Base.include_root_in_json = false
    document = Document.find(params[:data][:id])
    order=-1;
     res = document.document_versions.map{|dv| 
      order = order+1
      dv.to_info.merge({:short_name=> order}) #:id=>dv.id, :name=> "[#{dv.id}] REV #{ order }",:created_at=>dv.created_at, :updated_at=>dv.updated_at, :has_data=>!dv.document_data.nil?, :file_name=>dv.file_name, :stat => dv.doc_stat_id
    }
    render :json => res
    logger.debug res.inspect
  end
  
  def list_document_versions_by_id_array
    doc_version_array = params[:data][:doc_versions][:item]
    logger.debug doc_version_array.inspect
    res =  doc_version_array.compact.map{ |dv_id|
      dv = DocumentVersion.find(dv_id)
      dv.to_info
    }
    logger.debug res.length
    render :json => res
  end
  
  
  #------------------------------------------------------------------------------------------------------------------------------------------
  # implementation for restricted lists:
  
  # groups are returned according the the users groups unless the user has the highest permission level
  def list_groups
    if @user.permission_level.value == PermissionLevel.order("value DESC").first.value
      render :json => Group.find(:all).map{|g| g}
    else
      render :json => @user.groups.map{|g| g}
    end
  end
  
  #Permission levels are returned only up to the users permission level
  def list_permission_levels
    pls = []
    PermissionLevel.order("value DESC").each{|pl| 
      if pl.value <= @user.permission_level.value
        pls << pl
      end
    }
    render :json => pls
  end
  
  
  
  
end
