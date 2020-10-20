class Operation::Product::Clinic::Retention < ApplicationRecord

  self.table_name = "clinic_retentions"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end