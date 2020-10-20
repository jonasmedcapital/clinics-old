class Operation::Product::Clinic::Observation < ApplicationRecord

  self.table_name = "clinic_observations"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end