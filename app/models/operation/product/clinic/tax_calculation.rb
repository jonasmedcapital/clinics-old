class Operation::Product::Clinic::TaxCalculation < ApplicationRecord

  self.table_name = "clinic_tax_calculations"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end