class Operation::Product::Clinic::Cnae < ApplicationRecord

  self.table_name = "clinic_cnaes"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end