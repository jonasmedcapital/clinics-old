class Operations::Products::Clinics::::Invoices::RuleRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.? = attrs["?"] 
    obj.? = attrs["?"]
    obj.? = attrs["?"] 
    
    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(rules)
    mapper.map_all(rules)
  end

  def self.read(rule)
    mapper.map(rule)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Invoice::Rule".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Invoices::RuleMapper".constantize
  end

end
