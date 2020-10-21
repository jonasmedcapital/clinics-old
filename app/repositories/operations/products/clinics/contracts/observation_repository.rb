class Operations::Products::Clinics::::Contracts::ObservationRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.? = attrs["?"]
    obj.? = attrs["?"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(obeservations)
    mapper.map_all(obeservations)
  end

  def self.read(obeservation)
    mapper.map(obeservation)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Contract::Observation".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Contracts::ObservationMapper".constantize
  end

end