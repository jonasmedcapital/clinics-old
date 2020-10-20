class Operation::Product::Clinic::Password < ApplicationRecord

  self.table_name = "clinic_passwords"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end