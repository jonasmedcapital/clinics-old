class Operations::Products::Clinics::::Contracts::RetentionRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.? = attrs["?"]
    obj.? = attrs["?"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(retentions)
    mapper.map_all(retentions)
  end

  def self.read(retention)
    mapper.map(retention)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Contract::Retention".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Contracts::RetentionMapper".constantize
  end

end