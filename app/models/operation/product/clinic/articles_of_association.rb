class Operation::Product::Clinic::ArticlesOfAssociation < ApplicationRecord

  self.table_name = "clinic_articles_of_associations"
  
  # Relations
  belongs_to :clinic, class_name: "Operation::Product::Entity", foreign_key: "clinic_id"

  # Validations
  

  #Callbacks  
end