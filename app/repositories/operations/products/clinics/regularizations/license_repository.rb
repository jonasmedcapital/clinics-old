class Operations::Products::Clinics::::Regularizations::LicenseRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.company_id = attrs["company_id"]
    obj.clinic_id = attrs["clinic_id"] 
    obj.contract_id = attrs["contract_id"] 
    obj.code = attrs["code"] 
    obj.has_validity = attrs["has_validity"] 
    obj.validity = attrs["validity"] 
    obj.warn_with = attrs["warn_with"] 
    obj.warn_flag = attrs["warn_flag"] 
    obj.type = attrs["type"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(licenses)
    mapper.map_all(licenses)
  end

  def self.read(license)
    mapper.map(license)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Regularization::License".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Regularizations::LicenseMapper".constantize
  end

end
