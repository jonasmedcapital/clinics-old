class User::Contact::Email < ApplicationRecord
  include Contacts

  self.table_name = "contact_emails"

  # Relations
  belongs_to :account, class_name: "User::Account::Entity", foreign_key: "account_id"

  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validate :is_main_uniq
  validates :kind, presence: {message: "Favor insirar o Tipo. "}
  validates :address, presence: {message: "Por favor, insira o e-mail. "},
                    length: {maximum: 255, message: "Tamanho de e-mail inválido. "},
                    format: {with: VALID_EMAIL_REGEX, message: "E-mail inválido. "}

                    
  #Enums
  enum kind: { personal: 0, commercial: 1 }, _prefix: :_

  #Callbacks

  def to_name
    "E-mail"
  end

end