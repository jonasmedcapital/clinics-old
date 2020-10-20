class Operation::Product::Clinic::MunicipalTaxNumber < ApplicationRecord

  self.table_name = "clinic_municipal_tax_numbers"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations

  #Callbacks  
end