class Operations::Products::Clinics::::Corporate::PartnerRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.company_id = attrs["company_id"]
    obj.account_id = attrs["account_id"] 
    obj.contract_id = attrs["contract_id"] 
    obj.name = attrs["name"] 
    obj.cpf = attrs["cpf"] 
    obj.financial = attrs["financial"] 
    obj.operational = attrs["operational"] 
    obj.administrative = attrs["administrative"] 
    obj.doctor = attrs["doctor"] 
    obj.legal = attrs["legal"] 
    obj.shares = attrs["shares"] 
    obj.entried_at = attrs["entried_at"] 
    obj.exited_at = attrs["exited_at"] 
    obj.exited_description = attrs["exited_description"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(partners)
    mapper.map_all(partners)
  end

  def self.read(partner)
    mapper.map(partner)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Corporate::Partner".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Corporates::PartnerMapper".constantize
  end

end
