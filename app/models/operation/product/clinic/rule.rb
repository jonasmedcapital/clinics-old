class Operation::Product::Clinic::Rule < ApplicationRecord

  self.table_name = "clinic_rules"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end