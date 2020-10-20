class Operation::Product::Clinic::Invoice < ApplicationRecord

  self.table_name = "clinic_invoices"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end