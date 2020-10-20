class Operation::Product::Clinic::Taker < ApplicationRecord

  self.table_name = "clinic_takers"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end