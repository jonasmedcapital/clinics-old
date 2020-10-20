class Operation::Product::Date < ApplicationRecord

  self.table_name = "product_dates"
  default_scope -> {order(updated_at: :desc)}
  
  # Relations
  belongs_to :product, class_name: "Product::Entity", foreign_key: "product_id"

  # Validations
  validates :product_id, presence: { message: "Falta definir o Produto. " }
  validates :uniq_product_date, uniqueness: { case_sensitive: false, message: "Período já existente. " }

  #Callbacks
  before_validation :set_uniq_product_date

  def set_uniq_product_date
    self.uniq_product_date = "#{self.product_id} | #{self.month} | #{self.year}"
  end
  
end