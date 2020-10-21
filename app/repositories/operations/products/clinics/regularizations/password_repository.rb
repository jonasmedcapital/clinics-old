class Operations::Products::Clinics::::Regularizations::PasswordRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.clinic_id = attrs["clinic_id"] 
    obj.company_id = attrs["company_id"]
    obj.certificate_pass = attrs["certificate_pass"] 
    obj.issue_pass = attrs["issue_pass"] 
    obj.license_pass = attrs["license_pass"] 
    
    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(passwords)
    mapper.map_all(passwords)
  end

  def self.read(password)
    mapper.map(password)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Regularization::Password".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Regularizations::PasswordMapper".constantize
  end

end
