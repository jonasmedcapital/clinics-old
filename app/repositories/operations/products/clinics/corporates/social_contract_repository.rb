class Operations::Products::Clinics::::Corporate::SocialContractRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.company_id = attrs["company_id"]
    obj.social_capital = attrs["social_capital"] 
    obj.shares = attrs["shares"] 
    obj.social_object = attrs["social_object"] 
    obj.aministration_clause = attrs["aministration_clause"] 
    obj.company_type = attrs["company_type"] 
    obj.profit_distribution = attrs["profit_distribution"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(social_contracts)
    mapper.map_all(social_contracts)
  end

  def self.read(social_contract)
    mapper.map(social_contract)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Corporate::SocialContract".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Corporates::SocialContractMapper".constantize
  end

end
