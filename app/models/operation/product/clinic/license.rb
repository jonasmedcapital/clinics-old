class Operation::Product::Clinic::License < ApplicationRecord

  self.table_name = "clinic_licenses"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end