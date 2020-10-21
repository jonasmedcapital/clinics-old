class Operations::Products::Clinics::::Regularizations::CityRegistrationRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.clinic_id = attrs["clinic_id"] 
    obj.company_id = attrs["company_id"]
    obj.number = attrs["number"] 

    return obj
  end

  def self.all_active
    entity.where(active: true)
  end

  def self.list_all(city_registrations)
    mapper.map_all(city_registrations)
  end

  def self.read(city_registration)
    mapper.map(city_registration)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  private

  def self.entity
    "Operation::Product::Clinic::::Regularization::CityRegistration".constantize
  end

  def self.mapper
    "Operations::Products::Clinics::::Regularizations::CityRegistrationMapper".constantize
  end

end
