class Operations::Products::Clinics::::Invoices::TaxCaclulationRepository < Base

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

  def self.list_all(tax_calculations)
    mapper.map_all(tax_calculations)
  end

  def self.read(tax_calculation)
    mapper.map(tax_calculation)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Invoice::TaxCaclulation".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Invoices::TaxCaclulationMapper".constantize
  end

end
