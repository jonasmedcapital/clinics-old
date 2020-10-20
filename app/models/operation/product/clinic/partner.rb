class Operation::Product::Clinic::Partner < ApplicationRecord

  self.table_name = "clinic_partners"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end