class Operations::Products::Clinics::::Contracts::TakerRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.? = attrs["?"]
    obj.? = attrs["?"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(takers)
    mapper.map_all(takers)
  end

  def self.read(taker)
    mapper.map(taker)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Contract::Taker".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Contracts::TakerMapper".constantize
  end

end