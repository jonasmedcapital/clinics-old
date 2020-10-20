class Operation::Product::Clinic::SocialContract < ApplicationRecord

  self.table_name = "clinic_social_contracts"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations
  

  #Callbacks  
end