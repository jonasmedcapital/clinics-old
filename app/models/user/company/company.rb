class User::Company::Entity < ApplicationRecord
  include CnpjValidates
  include Contacts
  extend FriendlyId
  friendly_id :cnpj, use: :slugged

  self.table_name = "company_entities"
  default_scope -> {order(name: :asc)}

  attr_accessor :email, :phone, :cnpj_pretty

  
  # Relations
  
  has_many :emails, class_name: "Contact::Email", foreign_key: "company_id", dependent: :destroy
  has_many :phones, class_name: "Contact::Phone", foreign_key: "company_id", dependent: :destroy
  has_many :addresses, class_name: "Contact::Address", foreign_key: "company_id", dependent: :destroy
  


  # Validations
  validates :trade_name, presence: { message: "Por favor, insira a Razão Social. " },
                         uniqueness: { case_sensitive: false, message: "Razão Social já existe na base. " }
  validates :name, presence: { message: "Por favor, insira o Nome Fantasia. " }
  validates :kind, presence: { message: "Falta o tipo de Empresa. " }
  validate :cnpj_validate
  validates :cnpj, presence: { message: "Por favor, insira o CNPJ. " },
                  uniqueness: { case_sensitive: false, message: "CNPJ já existe na base. " },
                  length: { in: 14..14, message: "Formato errado do CNPJ. " }
  

  #Callbacks

  #Enums


  def cnpj_pretty
    ::CompanyDecorator.new(self).cnpj_pretty
  end
   
end