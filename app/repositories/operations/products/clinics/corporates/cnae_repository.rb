class Operations::Products::Clinics::::Corporate::CnaeRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.company_id = attrs["company_id"]
    obj.cnae_code = attrs["cnae_code"] 
    obj.cnae_description = attrs["cnae_description"] 
    obj.ctiss_code = attrs["ctiss_code"] 
    obj.ctiss_description = attrs["ctiss_description"] 
    obj.ctiss_short = attrs["ctiss_short"] 
    obj.ctiss_full = attrs["ctiss_full"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(cnaes)
    mapper.map_all(cnaes)
  end

  def self.read(cnae)
    mapper.map(cnae)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Corporate::Cnae".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Corporates::CnaeMapper".constantize
  end

end

