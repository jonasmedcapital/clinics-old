class Operations::Products::Clinics::::Invoices::EntityRepository < Base

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

  def self.list_all(entities)
    mapper.map_all(entities)
  end

  def self.read(entity)
    mapper.map(entity)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Invoice::Entity".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Invoices::EntityMapper".constantize
  end

end
