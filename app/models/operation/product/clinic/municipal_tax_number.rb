class Operation::Product::Clinic::CityRegistration < ApplicationRecord

  self.table_name = "clinic_city_registrations"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end